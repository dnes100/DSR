class LevelsController < ApplicationController
  def index
    @levels = Level.all
  end
  
  def new
    @level = Level.new
  end
  
  def create
    @level = Level.new(level_params)
    
    if @level.save
      redirect_to level_path(@level.level_id), notice: "Level is successfully created."
    else
      render :new
    end
  end
  
  def show
    @level = Level.find_by_level_id(params[:level_id])
  end
  
  def edit
    @level = Level.find_by_level_id(params[:level_id])
  end
  
  def update
    @level = Level.find_by_level_id(params[:level][:level_id])
    
    if @level.update(level_params)
      redirect_to level_path(@level.level_id), notice: "Level is successfully updated."
    else
      render :edit
    end
  end
  
  def destroy
    @level = Level.find_by_level_id(params[:level_id])
    @level.destroy
    redirect_to levels_path, notice:  'Level is successfully deleted.'
  end
  
  private
  def level_params
    params.require(:level).permit(:level_id, :level_name)
  end
end
