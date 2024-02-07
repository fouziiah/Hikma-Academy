# frozen_string_literal: true

class TeacherController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def courses
    if current_user.is_teacher?
      @courses = current_user.teaching_courses.includes(:enrollments)
    else
      flash[:notice] = 'You are not authorized to view this page.'
      redirect_to root_path
    end
  end

  def students
    if current_user.is_teacher?
      @courses = current_user.teaching_courses.includes(enrollments: :user)
      @students = Set.new
      @courses.each do |course|
        course.students.each do |student|
          @students.add(student) if student.is_student?
        end
      end
    else
      flash[:notice] = 'You are not authorized to view this page.'
      redirect_to root_path
    end
  end
end
