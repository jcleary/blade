class TestsController < ApplicationController
  def index
    @project = Project.find params[:project_id]
    @tests = @project.tests
  end 

  def show
    @project = Project.find params[:project_id]
    @test = @project.tests.find params[:id]
  end
end

