# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gon_variables

  def show
    @render_cart = true
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity.positive?
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
  def set_gon_variables
    gon.env_variables = {
      STRIPE_PUBLIC_KEY: ENV['STRIPE_PUBLIC_KEY'],
      STRIPE_SECRET_KEY: ENV['STRIPE_SECRET_KEY']
    }
  end
end
