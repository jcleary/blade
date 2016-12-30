class TestRunsController < ApplicationController
  def index
    @project = Project.find params[:project_id]
    @build = @project.builds.find params[:build_id]
    @test_runs = @build.test_runs
    if params[:status].present?
      @test_runs = @test_runs.where(status: params[:status])
    end
  end 
end

