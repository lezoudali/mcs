require 'spec_helper'

describe User do
  before do 
    @user = create_user
  end
  
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email)}
  it { should respond_to(:password)}
  it { should respond_to(:password_confirmation)}
  it { should respond_to(:auth_token)}
  it { should respond_to(:comments)}

  it { should be_valid }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_confirmation_of(:password) }
  it { should validate_uniqueness_of(:auth_token)}
  it { should allow_value('example@domain.com').for(:email) }

  it { should have_many(:comments)}
  it { should have_many(:shares) }
  it { should have_many(:shared_videos)}

  it "should soft delete" do 
    @user.delete
    @user.deleted_at.should_not be_nil
  end 

  it "should hard delete when passed as argument" do 
    @user.delete(mode: :hard)
    User.count.should eql 0
  end

  describe "#generate_authentication_token!" do 
    it "generates a unique token" do 
      Devise.stub(:friendly_token).and_return("auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).to eql("auniquetoken123")
    end

    it "generates another token when one already has been taken" do
      existing_user = create_user auth_token: "auniquetoken123"
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eql existing_user.auth_token
    end
  end

  describe "videos associations" do 
    before do 
      @video = create_video 
      @user.save
      @share = create_share sharer: @user, shared_video: @video
    end

    it "returns videos user shared" do 
      expect(@user.shared_videos).to include(@video)
    end
  end

  describe "mcs_admin" do 
    context "when user is not an admin" do 
      it "#mcs_admin? return true when user is also an admin" do 
        expect(@user.mcs_admin?).to be false
      end

      it "returns nil for #mcs_admin" do 
        expect(@user.mcs_admin).to be_nil
      end
    end

    context "when user is admin" do 
      before do 
        @user.save
        @mcs_admin = create_mcs_admin user_id: @user.id
      end
      it "#mcs_admin? return true when user is also an admin" do 
        expect(@user.mcs_admin?).to be true
      end

      it "#mcs_admin returns the admin object" do 
        expect(@user.mcs_admin).to eql @mcs_admin
      end
    end
  end
end
