class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def show
      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  
      current_user.set_payment_processor(:stripe)
      current_user.payment_processor.pay_customer
  
      course_id = params[:course_id]
      @course = Course.find(course_id)
  
      @checkout_session = current_user
                            .payment_processor
                            .checkout(
                              mode: @course.recurring? ? 'subscription' : 'payment',
                              line_items: @course.product.stripe_price_id,
                              success_url: courses_url
                            )                             
  end
end