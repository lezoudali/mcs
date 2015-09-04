class Api::V1::VideoLikesController < ApplicationController
  before_action :authenticate_with_token!,  only: [:create, :destroy]
  before_action :set_video, only: :create

  def create
    video_like = @video.video_likes.build
    video_like.user = current_user

    if video_like.save 
      render json: {video_id: video_like.video.id, user_id: video_like.user.id}, status: 201
    else
      render json: { errors: video_like.errors }, status: 422
    end
  end

  def destroy
    video_like = current_user.video_likes.find(params[:id])
    video_like.destroy if video_like
    head 204
  end

  protected

  def set_video
    @video = Video.find_by(id: params[:video_id])
    render json: { errors: "Video Not Found"}, status: 422 and return unless @video
  end
end
