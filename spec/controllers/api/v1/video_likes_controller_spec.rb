require 'spec_helper'

describe Api::V1::VideoLikesController do
  before do
    @user = create_user
    @video = create_video
  end

  describe "GET #index" do
    context "when user doesn't like the video" do
      before do
        api_authorization_header @user.auth_token
        get :index, { video_id: @video.id }
      end

      it "renders a json of the current user's like for the video" do
        video_like_response = json_response
        expect(video_like_response).to eql({})
      end

      it { should respond_with 404}
    end

    context "when user likes the video" do
      before do
        api_authorization_header @user.auth_token
        post :create, { video_id: @video.id }
        get :index, { video_id: @video.id }
      end

      it "renders a json of the current user's like for the video" do
        video_like_response = json_response
        expect(video_like_response[:video_likes][0][:video_id]).to eql @video.id
        expect(video_like_response[:video_likes][0][:user_id]).to eql @user.id
      end

      it { should respond_with 200}
    end
  end

  describe "POST #create" do
    context "when video_like is successfully created" do
      before do
        api_authorization_header @user.auth_token
        post :create, { video_id: @video.id }
      end

      it "renders a json of new video_like" do
        video_like_response = json_response
        expect(video_like_response[:video_id]).to eql @video.id
      end

      it { should respond_with 201 }
    end

    context "when comment is not created" do
      before do
        post :create, { video_id: @video.id }
        @video_like_response = json_response
      end

      it "renders json with errors" do
        expect(@video_like_response.keys).to include(:errors)
      end

      it "renders errors messages" do
        expect(@video_like_response[:errors]).to include("Not authenticated")
      end

      it { should respond_with 401 }
    end
  end

  describe "DELETE #destroy" do
    before do
      api_authorization_header @user.auth_token
      @video_like = create_video_like(user: @user)
      delete :destroy, { id: @video_like.id }
    end

    it "deletes video_like" do
      @user.video_likes.should_not include @video_like
      response.status.should be 204
    end
  end
end
