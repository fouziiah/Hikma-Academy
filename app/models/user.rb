class User < ApplicationRecord
  belongs_to :role, optional: true
  has_many :children
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
    roles.exists?(name: 'teacher')
  end 
end
