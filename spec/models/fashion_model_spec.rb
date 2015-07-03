require 'spec_helper'

describe FashionModel do
  before do 
    @fashion_model = create_fashion_model
  end

  subject { @fashion_model }

  it { should belong_to(:user) }
  it { should respond_to(:instagram) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:instagram) }
  it { should validate_uniqueness_of :user_id }
  it { should have_many :fashion_models_videos }
  it { should have_many :videos }

  it { should be_valid }

  describe "user association" do 
    before do 
      @user = create_user
      @fashion_model.user = @user
    end

    it "returns the user associated to the fashion_model" do 
      expect(@fashion_model.user).to eql @user
    end
  end

  describe "videos association" do 
    before do 
      @fashion_model.save
      @fashion_models_video = create_fashion_models_video fashion_model: @fashion_model
    end

    it "returns the correct amount of videos" do 
      expect(@fashion_model.videos.size).to eql(1)
    end
  end
end
