class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  skip_before_action :authorized

  def create
    @user = User.new(user_params)
    if @user.save
      token = encode_token({ user_id: @user.id })

      json_response({
        data: @user,
        token: token
      })
    else
      render json: {error: "Signup: Invalid email or password"}

      json_response({
        error: "Signup failed!",
        messages: @user.errors
      }, :unprocessable_entity)
    end
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })

      json_response({
        data: @user,
        token: token
      })
    else
      json_response({
        error: "Login: Invalid email or password"
      }, :unauthorized)
    end
  end


  private

  def user_params
    params.permit(:username, :name, :email, :password, :password_confirmation)
  end
end
