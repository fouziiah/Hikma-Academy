# frozen_string_literal: true

class ChangeDatatypeForPriceInProducts < ActiveRecord::Migration[7.1]
  def change
    change_column :products, :price, :integer
  end
end
