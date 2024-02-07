# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :amount
      t.string :course_ids
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
