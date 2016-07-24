class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end
  
  def create
    member = Employee.authenticate(params[:email], params[:password])
    if member
      session[:member_id] = member.employee_id
      if current_user.lead?
      redirect_to tasks_path, :notice => "Logged in!"
      else
        redirect_to new_task_path, :notice => "Logged in!"
      end
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:member_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
