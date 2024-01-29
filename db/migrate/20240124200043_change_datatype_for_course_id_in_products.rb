class ChangeDatatypeForCourseIdInProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :course_id
    add_reference :products, :course, foreign_key: true
  end
end
