# frozen_string_literal: true

class PaymentsController < ApplicationController
  Stripe.api_key = ENV['STRIPE_SECRET_KEY']

  def create
    @payment = Payment.new(payment_params)

    # charge user card
    Stripe::Charge.create({
                            amount: @payment.amount * 100, # convert to cents
                            currency: 'usd',
                            source: params[:stripe_token],
                            description: 'Hikma Academy Course'
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
