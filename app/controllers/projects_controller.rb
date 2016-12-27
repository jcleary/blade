class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order(:name)
  end 

  def show
    @project = Project.find params[:id]
  end
end
