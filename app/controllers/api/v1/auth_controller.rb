class Api::V1::AuthController < ApplicationController
  def has_valid_token 
    render json:{
      has_valid_token: valid_token?
    }
  end
end