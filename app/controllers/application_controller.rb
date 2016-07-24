class ApplicationController < ActionController::Base
  before_action :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  
  private
  def current_user
    @current_user ||= Employee.find_by_employee_id(session[:member_id]) if session[:member_id]
  end
  
  def require_login
    if !current_user
      redirect_to new_session_path
    end
  end
  
end
