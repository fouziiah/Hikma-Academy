class Course < ApplicationRecord
  belongs_to :child, optional: true
  has_many :enrollments
  has_many :users, through: :enrollments
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'
  has_many :students, through: :enrollments, source: :user
  has_one_attached :image

  enum status: { open: 0, closed: 1, archived: 3 }
  enum course_type: { regular: 0, workshop: 1, retreat: 3 }
  enum format: { online: 0, location: 1 }
  enum payment_type: { once: 0, recurring: 1 }
end