class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:show, :update, :destroy]
  
  def show
    user = User.find_by_id(params[:id])
    if user 
      render json: user, status: 200 
    else 
      render json: { errors: ["User Not Found"]}
    end
    #render json: {errors: "user deleted", deleted_at: user.deleted_at}, status: 404
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update
    user = current_user
    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def destroy
    current_user.destroy
    head 204
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

