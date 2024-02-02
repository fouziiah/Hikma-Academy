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

  pay_customer stripe_attributes: :stripe_attributes

  def stripe_attributes(pay_customer)
    {
      metadata: {
        pay_customer_id: id,
        user_id: id
      }
    }
  end
  
  def is_teacher?
    role.present? && role.name == 'teacher'
  end 
              
  def is_student?
    role.present? && role.name == 'student'
  end 

  def self.ransackable_associations(auth_object = nil)
    ["role"]
  end

  def self.ransackable_attributes(auth_object = nil)
    [
      "id",
      "first_name",
      "last_name",
      "username",
      "phone",
      "email",
      "encrypted_password",
      "reset_password_token",
      "reset_password_sent_at",
      "remember_created_at",
      "confirmation_token",
      "confirmed_at",
      "confirmation_sent_at",
      "unconfirmed_email",
      "created_at",
      "updated_at"
    ]
  end

end