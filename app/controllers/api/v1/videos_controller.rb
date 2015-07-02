class Api::V1::VideosController < ApplicationController

  def index
    videos = Video.all
    render json: videos, status: 200
  end

  def show
    video = Video.find(params[:id])
    render json: video, status: 200
  end

  def create
    render json: { errors: "User not an McsAdmin" } and return unless current_user.mcs_admin?
    video = current_user.mcs_admin.videos.build(video_params)
    if video.save
      render json: video, status: 201, location: [:api, video]
    else
      render json: { errors: video.errors }, status: 422
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :views, :source_url)
  end
end
