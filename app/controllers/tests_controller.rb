class TestsController < ApplicationController
  def index
    @project = Project.find params[:project_id]
    @tests = @project.tests
  end 
end

