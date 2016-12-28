class BuildsController < ApplicationController
  def index
    @project = Project.find params[:project_id]
    @builds = @project.builds.order(created_at: :desc)
  end 
end

