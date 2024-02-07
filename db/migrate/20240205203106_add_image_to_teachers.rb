# frozen_string_literal: true

class AddImageToTeachers < ActiveRecord::Migration[7.1]
  def change
    add_column :teachers, :image, :string
  end
end
