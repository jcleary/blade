class Api::BuildsController < Api::BaseController
  def create
    @project = Project.find params[:project_id]
    add_tests(params[:build][:examples])
    
    head :created
  end

  private 

  def add_tests(tests)
    tests.each do |test|


    end
  end

end
