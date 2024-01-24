class AddPriceToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :price, :integer
  end
end
