require 'spec_helper'

describe Video do
  before do 
    @video = FactoryGirl.create(:video)
  end
  
  subject { @video }

  it { should respond_to(:title)}
  it { should respond_to(:description)}
  it { should respond_to(:source_url)}
  it { should respond_to(:model)} #belong_to
  it { should respond_to(:shares)}

  it { should be_valid }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:model_id) }
  it { should validate_presence_of(:source_url) }
  it { should validate_uniqueness_of(:source_url) }

  it { should have_many(:video_plays) }
  it { should have_many(:viewers) }

  describe "users associations" do 
    before do 
      @user = FactoryGirl.build :user
      @video_play = FactoryGirl.create :video_play, viewer: @user, watched_video: @video
    end

    it "returns #users who viewed the video" do 
      expect(@video.viewers).to include(@user)
    end
  end

  it "should soft delete" do 
    @video.delete
    @video.deleted_at.should_not be_nil
  end
end
