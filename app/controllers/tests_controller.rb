class TestsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource

  def index
  end 

  def show
  end
end

