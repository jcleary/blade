class Api::BuildsController < Api::BaseController
  def create
    @project = Project.find params[:project_id]
    @build = Build.create!(
      project_id: @project.id,
      request_body: { examples: params[:examples] }
    )
    @build.delay.process_request_body
    head :created

  rescue ActiveRecord::RecordInvalid
    render json: { errors: @build.errors.full_messages }, status: :bad_request
  end
end
