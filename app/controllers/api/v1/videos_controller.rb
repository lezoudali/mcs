class Api::V1::VideosController < ApplicationController
  before_action :authenticate_with_token!, :check_admin, only: [:create, :update, :destroy]

  def index
    videos = Video.includes(:comments, :shares).all #pagination, cursor, max id, since ids, will_paginate?, .limit
    render json: videos, each_serializer: VideoIndexSerializer, status: 200
  end

  def show
    video = Video.includes(:comments, :shares).find(params[:id])#n+1
    render json: video, status: 200 #counter cache
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
    render json: { errors: ["User not an mcs_admin"] }, status: 422 and return unless current_user.mcs_admin? 
  end

  def video_params
    params.require(:video).permit(:title, :description, :views, :source_url, :index_num, :poster_image_url, :fashion_model_name)
  end
end

#MVP, make a safe
