# frozen_string_literal: true

class AddStripeIdsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :stripe_product_id, :string
    add_column :products, :stripe_price_id, :string
  end
end
