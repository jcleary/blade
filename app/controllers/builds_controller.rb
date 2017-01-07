class BuildsController < ApplicationController
  load_and_authorize_resource :project 
  load_and_authorize_resource

  def index
    @builds = @builds.order(created_at: :desc)
  end 
end

