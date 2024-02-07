# frozen_string_literal: true

class ChangeDataTypesForThreeColumnsInCourses < ActiveRecord::Migration[7.1]
  def change
    change_column :courses, :course_type, :integer, using: 'course_type::integer', default: 0
    change_column :courses, :format, :integer, using: 'course_type::integer', default: 0
    change_column :courses, :payment_type, :integer, using: 'course_type::integer', default: 0
  end
end
