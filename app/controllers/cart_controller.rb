class CartsController < ApplicationController
    before_action :authenticate_user!
  
    def checkout
      if payment_successful(@cart)
        @cart.cart_products.each do |cart_product|
          Enrollment.find_or_create_by(user: current_user, course: cart_product.product.course)
        end
        flash[:notice] = "Purchase successful! You are now enrolled in the courses."
        redirect_to courses_path
      else
        flash[:alert] = "There was a problem processing your payment."
        render :show
      end
    end
  
    def destroy
      @cart.cart_products.destroy_all
      flash[:notice] = "Your cart has been emptied."
      redirect_to cart_path
    end
  
    private
  
    def payment_successful(cart)
        
        
    end
  end
  