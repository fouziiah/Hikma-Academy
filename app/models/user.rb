class User < ApplicationRecord
  belongs_to :role, optional: true
  has_many :children
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  
  def is_teacher?
    roles.exists?(name: 'teacher')
  end 
end
