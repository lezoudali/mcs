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
      before(:each) do
        @mcs_admin = create_mcs_admin
        @invalid_video_attributes = {title: "Video Title", description: "Video Description"}
        api_authorization_header @mcs_admin.user.auth_token
        post :create, { user_id: @mcs_admin.user.id, video: @invalid_video_attributes }
      end

      it "renders and errors json" do 
        video_response = json_response
        expect(video_response.keys).to include(:errors)
      end

      it "renders the json error why product could not be created" do
        video_response = json_response
        expect(video_response[:errors][:source_url]).to include "can't be blank"
      end

      it "renders error when current_user is not an mcs_admin" do
        sign_out @mcs_admin.user
        user = create_user
        api_authorization_header user.auth_token
        post :create, { user_id: user.id, video: attributes_for(:video) }
        expect(json_response[:errors]).to include "not an mcs_admin"
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do 
    before(:each) do 
      @mcs_admin = create_mcs_admin
      @video = create_video mcs_admin_id: @mcs_admin.id
      api_authorization_header @mcs_admin.user.auth_token
    end

    context "when video is successfully updated" do 
      before(:each) do 
        patch :update, { user_id: @mcs_admin.user.id, id: @video.id, video: { title: "Kendall Jenner muy caliente LOL"}}
      end

      it "renders json for updated video" do 
        expect(json_response[:title]).to eql "Kendall Jenner muy caliente LOL"
      end

      it { should respond_with 200 }
    end

    context "when video is not updated" do 
      before(:each) do 
        patch :update, { user_id: @mcs_admin.user.id, id: @video.id, video: { title: nil}}
      end

      it "renders an errors" do 
        expect(json_response.keys).to include(:errors)
      end

      it "renders validation errors" do 
        expect(json_response[:errors][:title]).to include "can't be blank"
      end

      it "renders error when current_user is not an mcs_admin" do
        sign_out @mcs_admin.user
        user = create_user
        api_authorization_header user.auth_token
        patch :update, { user_id: user.id, id: @video.id, video: { title: "Kendall Jenner"}}
        expect(json_response[:errors]).to include "not an mcs_admin"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do 
    before(:each) do 
      @mcs_admin = create_mcs_admin
      @video = create_video mcs_admin: @mcs_admin
      api_authorization_header @mcs_admin.user.auth_token
    end

    it "deletes vid when current_user is admin" do 
      delete :destroy, { user_id: @mcs_admin.user.id, id: @video.id }
      json_response[:deleted_at].should_not be_nil
      response.status.should be 204
    end

    it "fails to delete if current_user isnt a mcs_admin" do 
      sign_out @mcs_admin.user
      user = create_user
      api_authorization_header user.auth_token
      delete :destroy, { user_id: @mcs_admin.user.id, id: @video.id }
      expect(json_response[:errors]).to include("not an mcs_admin")
    end
  end
end













