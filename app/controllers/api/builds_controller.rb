class Api::BuildsController < Api::BaseController
  def create
    @project = Project.find params[:project_id]
    @build = Build.create!(
      project_id: @project.id,
      request_body: { examples: params[:examples] }
    )
    head :created

  rescue ActiveRecord::RecordInvalid
    head :internal_server_error
  end
end
