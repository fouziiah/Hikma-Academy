class Course < ApplicationRecord
  belongs_to :user
  belongs_to :child, optional: true
  has_one_attached :image

  enum status: { open: 0, closed: 1, archived: 3 }
end
