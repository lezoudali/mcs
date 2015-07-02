require 'spec_helper'

describe Api::V1::VideosController do 

  describe "GET #show" do 
    before(:each) do 
      @video = create_video
      get :show, id: @video.id
    end

    it "returns info about video in a hash" do 
      video_response = json_response
      expect(video_response[:title]).to eql @video.title
    end

    it { should respond_with 200}
  end

  describe "GET #index" do 
    before(:each) do 
      4.times { create_video }
      get :index
    end

    it "returns 4 video records" do
      videos_response = json_response
      expect(videos_response.size).to eql(4) 
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do 
    context "when video is successfully created" do 
      before(:each) do 
        @mcs_admin = create_mcs_admin
        @video_attributes = attributes_for :video
        api_authorization_header @mcs_admin.user.auth_token
        post :create, { user_id: @mcs_admin.user.id, video: @video_attributes}
      end

      it "renders json of newly created video" do
        video_response = json_response
        expect(video_response[:mcs_admin_id]).to eql @mcs_admin.id
      end

      it { should respond_with 201 }
    end

    context "when video is not created" do 
      it "returns error when attributes are invalid" do
        @mcs_admin = create_mcs_admin
        @invalid_video_attributes = {title: "Video Title", description: "Video Description"}
        api_authorization_header @mcs_admin.user.auth_token
        post :create, { user_id: @mcs_admin.user.id, video: @invalid_video_attributes }
        video_response = json_response
        expect(video_response[:errors][:source_url]).to include "can't be blank"
      end
    end
  end
end













