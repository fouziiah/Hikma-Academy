class User < ApplicationRecord
  belongs_to :role, optional: true
  has_many :enrollments
  has_many :children
  has_many :courses, through: :enrollments
  has_many :teaching_courses, class_name: 'Course', foreign_key: 'teacher_id'
  has_many :enrolled_courses, through: :enrollments, source: :course
  has_one_attached :image
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  
def is_teacher?
  role.present? && role.name == 'teacher'
end 
              
def is_student?
  role.present? && role.name == 'student'
end 
end