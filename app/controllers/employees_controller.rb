class EmployeesController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def home
    
  end
  
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    
    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_path(@employee.employee_id), notice: 'Employee is successfully registered.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @employee = Employee.find_by_employee_id(params[:employee_id])
  end

  def edit
    @employee = Employee.find_by_employee_id(params[:employee_id])
  end

  def update
    @employee = Employee.find_by_employee_id(params[:employee][:employee_id])
    
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employee_path(@employee.employee_id), notice: 'Employee is successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @employee = Employee.find_by_employee_id(params[:employee_id])
    @employee.destroy
    redirect_to employees_path, notice:  'Employee is successfully deleted.'
  end
  
  def download
    filename = case params[:file]
    when 'cv' then 'cv_dinesh'
    when 'application' then 'application_dinesh'
    else 'file'
    end
    
    path = "#{Rails.root}/public/#{filename}.pdf"
      
    send_file(path,
      filename: "#{filename}.pdf",
      type: "application/pdf")
  end
  
  
  def email_dsr 
    DsrMailer.send_dsr.deliver
    redirect_to tasks_path
  end
  
  private
  def employee_params
    params.require(:employee).permit(:employee_id, :employee_name, :level, :email, :password, :new_password, :new_password_confirmation)
  end
  
end
