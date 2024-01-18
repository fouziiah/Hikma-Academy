class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :teacher
      t.text :description
      t.string :capacity
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :course_type
      t.string :format
      t.string :payment_type
      t.references :user, null: false, foreign_key: true
      t.references :child, foreign_key: true

      t.timestamps
    end
  end
end
