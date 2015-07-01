require 'spec_helper'

describe User do
  before do 
    @user = FactoryGirl.build(:user) 
  end
  
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email)}
  it { should respond_to(:password)}
  it { should respond_to(:password_confirmation)}
  it { should respond_to(:auth_token)}

  it { should be_valid }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('example@domain.com').for(:email) }
  it { should validate_uniqueness_of(:auth_token)}

  it { should have_many(:video_plays) }
  it { should have_many(:watched_videos)}

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
      existing_user = FactoryGirl.create(:user, auth_token: "auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eql existing_user.auth_token
    end
  end

  describe "videos associations" do 
    before do 
      @video = FactoryGirl.build :video 
      @video_play = FactoryGirl.create :video_play, viewer: @user, watched_video: @video
    end

    it "returns videos user viewed" do 
      expect(@user.watched_videos).to include(@video)
    end
  end

end
