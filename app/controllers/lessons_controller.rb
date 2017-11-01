class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrollment_for_lesson

  def show
  end

  private

  def require_enrollment_for_lesson
    if current_user.enrolled_in?(current_course) == false
      redirect_to course_path(current_course), alert: 'You must be enrolled'      
    end
  end

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:id])
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
