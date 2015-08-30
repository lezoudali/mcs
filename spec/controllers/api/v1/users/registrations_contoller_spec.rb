require 'spec_helper'

describe Api::V1::Users::RegistrationsController do
  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @user_attributes = attributes_for :user
        @request.env["devise.mapping"] = Devise.mappings[:user]
        post :create, { user: @user_attributes }
      end

      it "renders the json representation for the user record just created" do
        user_response = json_response
        expect(user_response[:user][:email]).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        #notice I'm not including the email
        @invalid_user_attributes = { password: "12345678",
                                     password_confirmation: "12345678" }
        @request.env["devise.mapping"] = Devise.mappings[:user]
        post :create, { user: @invalid_user_attributes }
      end

      it "renders an errors json" do
        user_response = json_response
        expect(user_response.keys).to include(:errors)
      end

      it "renders the json errors on why the user could not be created" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end
end
