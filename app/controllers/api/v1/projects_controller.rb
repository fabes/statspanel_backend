class Api::V1::ProjectsController < ApplicationController
  def index 
    render json:{
      data: {
        'p1': 'test1',
        'p2': 'test2'
      }
    }
  end
end
