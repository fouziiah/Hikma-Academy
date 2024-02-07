class Payment < ApplicationRecord
  belongs_to :user

  after_create do
    payment = Payment.last
    courses = payment.course_ids.split(',').map(&:to_i)
    courses.each do |course_id|
      Enrollment.create(user_id: payment.user_id, course_id: course_id)
    end
  end
end