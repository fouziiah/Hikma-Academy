class StudentController < ApplicationController
    before_action :authenticate_user!
    def dashboard
        if current_user.is_student?
          @enrolled_courses = current_user.enrolled_courses
        else
          redirect_to root_path, alert: "You must be a student to view this page."
        end
      end
  
  end

  
  
  
  
   