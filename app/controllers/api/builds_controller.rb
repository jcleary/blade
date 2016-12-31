class Api::BuildsController < Api::BaseController
  def create
    Build.transaction do
      begin
        @project = Project.find params[:project_id]
        @build = Build.create(
          project_id: @project.id,
          request_body: { examples: params[:examples] }
        )
        head :created
      else
        head :internal_server_error
      end
    end
  end
end
