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
      test = @project.tests.find_or_create_by(description: example['full_description'])
      test.name = example['name']
      test.test_runs.create(
        build: @build,
        status: example['status'],
        duration: example['run_time']
      )
    end
  end

end
