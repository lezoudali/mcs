class Api::V1::VideosController < ApplicationController
  before_action :check_admin, only: [:create, :update, :destroy]

  def index
    videos = Video.where(deleted_at: nil)
    render json: videos, status: 200
  end

  def show
    video = Video.find(params[:id])
    render json: video, status: 200
  end

  def create
    video = current_user.mcs_admin.videos.build(video_params)
    if video.save
      render json: video, status: 201, location: [:api, video]
    else
      render json: { errors: video.errors }, status: 422
    end
  end

  def update
    video = current_user.mcs_admin.videos.find(params[:id])
    if video.update(video_params)
      render json: video, status: 200, location: [:api, video]
    else
      render json: { errors: video.errors }, status: 422
    end
  end

  def destroy
    video = Video.find(params[:id])
    video.destroy
    render json: video, status: 204
  end

  private

  def check_admin
    authenticate_with_token!
    render json: { errors: "User not an mcs_admin" }, status: 422 and return unless current_user.mcs_admin? 
  end

  def video_params
    params.require(:video).permit(:title, :description, :views, :source_url)
  end
end
