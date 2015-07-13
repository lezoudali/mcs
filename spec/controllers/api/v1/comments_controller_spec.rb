require 'spec_helper'

describe Api::V1::CommentsController do
  before do 
    @user = create_user
    @video = create_video
    api_authorization_header @user.auth_token
  end

  describe "POST #create" do 
    context "when comment is successfully created" do 
      before do 
        @comment_attributes = attributes_for :comment
        post :create, { video_id: @video.id, comment: @comment_attributes}
      end

      it "renders a json of new comment" do 
        comment_response = json_response[:comment]
        expect(comment_response[:content]).to eql @comment_attributes[:content]
      end

      it { should respond_with 201 }
    end

    context "when comment is not created" do 
      before do
        @invalid_comment_attributes = {content: ""}
        post :create, { video_id: @video.id, comment: @invalid_comment_attributes}
        @comment_response = json_response
      end

      it "renders json with errors" do 
        expect(@comment_response.keys).to include(:errors)
      end

      it "renders errors messages" do
        expect(@comment_response[:errors][:content]).to include("can't be blank")
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do 
    before do 
      @comment = create_comment user_id: @user.id, video_id: @video.id
    end

    context "when comment is successfully updated" do 
      before do 
        patch :update, { video_id: @video.id, id: @comment.id, comment: {content: "updated content"} }
      end

      it "renders json for updated comment" do 
        comment_response = json_response[:comment]
        expect(comment_response[:content]).to eql "updated content"
      end

      it { should respond_with 200 }
    end

    context "when comment is not updated" do 
      before do 
        patch :update, video_id: @video.id, id: @comment.id, comment: { content: ""}
        @comment_response = json_response
      end

      it "should render json errors" do 
        expect(@comment_response.keys).to include :errors
      end

      it "should render error message" do 
        expect(@comment_response[:errors][:content]).to include "is too short (minimum is 1 character)"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do 
    before do 
      @comment = create_comment(user: @user)
      delete :destroy, { id: @comment.id }
    end

    it "deletes comment" do 
      response.status.should be 204
    end
  end
end
