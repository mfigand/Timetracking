class EntriesController < ApplicationController

  def index
    @projects = Project.find(params[:project_id])
    @entries = @projects.entries
    @date = Date.today
    # @current_month_hours = @projects.total_hours_in_month(date.month, date.year)
  end

  def new
    @project = Project.find params[:project_id]
    @entry = @project.entries.new
  end

  def create
    # Find the project
    @project = Project.find(params[:project_id])
    # New entry
    @entry = @project.entries.new entry_params
    # Try to save it
    if @entry.save
      flash[:notice] = "Entry created succesfully"
      redirect_to action: :index, project_id: @project.id
    else
      flash[:alert] = "ALERT Entry not created"
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])

    if @entry.update_attributes entry_params
      redirect_to action: :index
    else
      render "edit"
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
    @entry.destroy
    redirect_to action: :index, project_id: @project.id
  end

  private

  # def proyect
  #   @_proyect ||= Project.find(params[:project_id])
  # end

  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end



end
