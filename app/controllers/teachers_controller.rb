# frozen_string_literal: true

class TeachersController < InheritedResources::Base
  private

  def teacher_params
    params.require(:teacher).permit(:name, :bio)
  end
end
