class TeacherController < ApplicationController
    before_action :authenticate_user!

    def dashboard
        @courses = Course.includes(:enrollments).where(user_id: current_user.id)
      end

end