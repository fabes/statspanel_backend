class Api::V1::ProjectsController < ApplicationController
  before_action :auth_request 

  def index 
    render json:{
      data: active_user.projects.all.select(:id, :name, :code)
    }
  end

  def create 
    project = Project.new(allowed_project_params)
    project.code = SecureRandom.hex(3)
    project.user = active_user
    project.status = 1

    if project.save 
      render json: {
        data: active_user.projects.all.select(:id, :name, :code)
      }
    else
      head(:bad_request)
    end
    
  end
  
  private 

  def allowed_project_params 
    params.permit(
      :name,
    )
  end
end
