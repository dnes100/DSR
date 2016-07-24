class TasksController < ApplicationController
  def index
    @tasks = {}
    Employee.all.each do |employee|
      @tasks[employee] =  Task.where(employee_id: employee.employee_id)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to task_path(@task.id), notice: 'Task is successfully added.'
    else
      render :new
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      redirect_to task_path(@task.id), notice: "Task is updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Task is deleted successfully."
  end
  
  private
  def task_params
    params.require(:task).permit(:employee_id, :task, :task_status, :date)
  end
end
