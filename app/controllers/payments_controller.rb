# frozen_string_literal: true

class PaymentsController < ApplicationController
  Stripe.api_key = ENV['STRIPE_SECRET_KEY']

  def create
    @payment = Payment.new(payment_params)

    product_ids = []
    courses = @payment.course_ids.split(',').map(&:to_i)
    courses.each do |course_id|
      product = Product.find_by(course_id:)
      product_ids << product.name
    end

    # charge user card
    Stripe::Charge.create({
                            amount: @payment.amount * 100, # convert to cents
                            currency: 'usd',
                            source: params[:stripe_token],
                            description: 'Hikma Academy Course',
                            metadata: {
                              COURSES: product_ids.to_json,
                              CUSTOMER: "#{@payment.first_name.capitalize} #{@payment.last_name.capitalize} | #{@payment.email}"
                            }
                          })

    @payment.save
    respond_to do |format|
      if @payment.save

        format.html { redirect_to students_path, notice: 'Payment was successful. Thanks for your payment' }
      end
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    render :new
  end

  private

  def payment_params
    params.permit(:first_name, :last_name, :email, :amount, :course_ids, :user_id)
  end
end
