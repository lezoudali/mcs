class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_video, only: [:create, :update]
  before_action :set_comment, :check_author, only: [:update, :destroy]


  def create
    comment = @video.comments.build(comment_params)
    comment.user = current_user
    if comment.save 
      render json: comment, status: 201
    else
      render json: { errors: comment.errors }, status: 422
    end
  end

  def update
    if @comment.user == current_user && @comment.update(comment_params)
      render json: @comment, status: 200
    else
      render json: { errors: @comment.errors }, status: 422
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy if comment
    head 204
  end

  private 

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_video
    @video = Video.find_by(id: params[:video_id])
    render json: { errors: "Video Not Found"}, status: 422 and return unless @video
  end

  def set_comment 
    @comment = current_user.comments.find(params[:id])
    render json: { errors: "Comment Not Found" }, status: 422 and return unless @comment
  end

  def check_author
    render json: { errors: "Comment does not belong to user!"}, status: 422 and return unless @comment.author? current_user
  end
end
