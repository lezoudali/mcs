require 'spec_helper'

describe Api::V1::Users::SessionsController do
  before(:each) do
    @user = create_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "POST #create" do
    context "when the credentials are correct" do
      before(:each) do
        credentials = { email: @user.email, password: "12345678"}
        post :create, { session: credentials }
      end

      it "returns the user record corresponding to the given credentials" do
        @user.reload
        expect(json_response[:user][:auth_token]).to eql @user.auth_token
      end

      it { should respond_with 200 }

      context "when the credentials are incorrect" do
        before(:each) do
          credentials = { email: @user.email, password: "invalidpassword"}
          post :create, { session: credentials }

          it "returns a json with an error" do
            expect(json_response[:errors]).to eql "Invalid email and/or passowrd"
          end

          it { should respond_with 422 }
        end
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      sign_in @user
      delete :destroy, id: @user.auth_token
    end

    it { should respond_with 204}
  end
end
