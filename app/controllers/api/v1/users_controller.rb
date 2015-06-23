class Api::V1::UsersController < ApplicationController

  def show
    user = User.find_by_id(params[:id])
    if user && user.deleted_at
      render json: {errors: "user deleted", deleted_at: user.deleted_at}, status: 404
    else
      render json: user, status: 200
    end
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
    user = User.find_by_id(params[:id])

    if user && user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
