require 'spec_helper'

describe Api::V1::Users::RegistrationsController do
  describe "POST #create" do
    before(:each) do
      @user_attributes = attributes_for :user
      @request.env["devise.mapping"] = Devise.mappings[:user]
      post :create, { user: @user_attributes }
    end

    context "when password is missing" do
      it "renders an errors json" do
        response_data = json_response
        expect(response_data.keys).to include(:errors)
      end

      it { should respond_with 422 }
    end

    context "when confirmation password is missing" do
      it { should respond_with 422 }
    end

    context "when email is missing" do
      it { should respond_with 422 }
    end

    context "when user is created" do
      it { should respond_with 201 }
    end
  end
end
