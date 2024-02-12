# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json

  def show
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    return if current_user.nil?

    current_user.set_payment_processor(:stripe)
    current_user.payment_processor.pay_customer

    @checkout_session = current_user
                        .payment_processor
                        .checkout(
                          mode: @course.recurring? ? 'subscription' : 'payment',
                          line_items: @course.product.stripe_price_id,
                          success_url: students_url
                        )
  end

  def new
    @course = Course.new
  end

  def edit; end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)
    @course.teacher_id = current_user.id if current_user.is_teacher?

    respond_to do |format|
      if @course.save
        save_course_to_products(@course)

        format.html { redirect_to course_url(@course), notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.enrollments.destroy_all

    @course.destroy

    respond_to do |format|
      if @course.destroyed?
        format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to courses_url, alert: 'Course could not be destroyed.' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::RecordNotDestroyed => e
    respond_to do |format|
      format.html { redirect_to courses_url, alert: e.message }
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :status, :capacity, :start_date, :end_date, :location,
                                   :course_type, :format, :payment_type, :user_id, :image, :price, :teacher_id)
  end

  # Save course information to the products table and create the product in Stripe
  def save_course_to_products(course)
    @product = Product.new(name: course.name, price: course.price, course_id: course.id)

    # Save the product to your local database
    if @product.save
      # Create the same product in Stripe
      create_product_in_stripe(@product)
    else
      Rails.logger.error("Error saving product: #{@product.errors.full_messages}")
    end
  end

  def create_product_in_stripe(product)
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    # Use the Stripe gem to create a product in Stripe
    stripe_product = Stripe::Product.create({
                                              name: product.name,
                                              type: 'good', # You can adjust this based on your product type
                                              description: @course.description
                                            })

    # Create a price for the product
    stripe_price = Stripe::Price.create({
                                          product: stripe_product.id,
                                          unit_amount: product.price * 100, # Stripe uses cents, so multiply by 100
                                          currency: 'usd', # Adjust the currency as needed
                                          recurring: @course.recurring? ? { interval: 'month' } : nil
                                        })

    # Update your local product with Stripe information
    if @product.update(stripe_product_id: stripe_product.id, stripe_price_id: stripe_price.id)
      Rails.logger.info('Product created in Stripe successfully.')
    else
      Rails.logger.error("Error updating product with Stripe information: #{product.errors.full_messages}")
    end
  end
end
