class Api::BuildsController < Api::BaseController
  def create
    @project = Project.find params[:project_id]
    @build = @project.builds.create 
    add_tests(params[:examples])
    
    head :created
  end

  private 

  def add_tests(examples)
    examples.each do |example|
      test = @project.tests.find_or_create_by(
        name: example['description'],
        description: example['full_description']
      )
      test.test_runs.create(
        build: @build,
        status: example['status'],
        duration: example['run_time']
      )
      test.update(
        average_duration: test.test_runs.average(:duration),
        passed_count: test.test_runs.where(status: 'passed').count,
        failed_count: test.test_runs.where(status: 'failed').count
      )
    end
  end
end
