class TeacherController < ApplicationController
    before_action :authenticate_user!

    def dashboard
        @courses = Course.where(user_id: current_user.id)
    end

end