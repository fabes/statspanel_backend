class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    if user_exist? 
      render json: {
        status: :bad_request,
        message: 'User already exist.'
      }
    else 
      new_user = User.create(parsed_params)
      if new_user 
        render json:{
          status: :success,
          token: new_user.authentication_token
        }
      else
        render json:{
          status: :bad_request,
          message: 'User was not created.'
        }
      end
    end
  end

  private

  def allowed_sign_up_params 
    params.permit(:full_name, :email, :password_confirmation, :password)
  end

  def user_exist? 
    User.find_by(email: allowed_sign_up_params[:email])
  end

  def parsed_params 
    full_name = allowed_sign_up_params[:full_name].split(' ')
    {
      first_name: full_name.first,
      last_name: full_name.last,
      email: allowed_sign_up_params[:email],
      password: allowed_sign_up_params[:password],
      password_confirmation: allowed_sign_up_params[:password_confirmation]
    }
  end
end
