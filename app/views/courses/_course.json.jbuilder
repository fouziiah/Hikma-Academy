# frozen_string_literal: true

json.extract! course, :id, :name, :teacher, :description, :status, :capacity, :start_date, :end_date, :location, :type,
              :format, :payment_type, :user_id, :child_id, :created_at, :updated_at
json.url course_url(course, format: :json)
