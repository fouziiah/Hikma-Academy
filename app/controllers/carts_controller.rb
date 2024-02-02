class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @render_cart = true
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity:)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                   partial: 'carts/cart',
                                                   locals: { cart: @cart }),
                              turbo_stream.replace(@product)]
      end
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'carts/cart',
                                                  locals: { cart: @cart })
      end
    end
  end

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
  