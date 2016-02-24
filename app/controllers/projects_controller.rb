class ProjectsController < ApplicationController

  def index
    @projects = Project.last_created_proyects(15)
    if @projects.empty?
      render template: "site/fetched_proyects_empty"
    end
  end

  def show
    @projects = Project.find(params[:id])
    if @projects == nil
     render_404(params)
    end
  end

end
