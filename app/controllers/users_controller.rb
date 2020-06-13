class UsersController < ApplicationController
  # before_action :authorized, only: [:auto_login]
  skip_before_action :authorized
  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Signup: Invalid email or password"}
    end
  end

  # LOGGING IN
  def login
    pp "LOGIN"
    @user = User.find_by(email: params[:email])
    pp "--------------"
    pp params
    pp params[:email]
    pp @user

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Login: Invalid email or password"}
    end
  end


  private
  def user_params
    params.permit(:username, :name, :email, :password, :password_confirmation)
  end
end
