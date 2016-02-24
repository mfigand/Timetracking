class EntriesController < ApplicationController

  def index
    @projects = Project.find(params[:project_id])
    @entries = @projects.entries

    date = Date.today
    @current_month_hours = @projects.total_hours_in_month(date.month, date.year)
  end

  def new
    @project = Project.find params[:project_id]
    @entry = @project.entries.new
  end

  def create
    # Find the project
    @project = Project.find(params[:project_id])
    # New entry
    @entry = @project.entries.new(hours: params[:hours], minutes: params[:minutes], date: params[:date])
    # Try to save it
    if @entry.save
      redirect_to action:


  end


end
