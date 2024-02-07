# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_products
  has_many :orderables
  has_many :products, through: :orderables
  has_many :products, through: :cart_products

  def total
    orderables.to_a.sum(&:total)
  end
end
