require 'spec_helper'

describe VideoPlay do
  let(:video_play) { FactoryGirl.build :video_play }
  subject { video_play }


  it { should belong_to(:viewer) }
  it { should belong_to(:watched_video) }

  it { should validate_uniqueness_of(:user_id)}
  it { should validate_uniqueness_of(:video_id)}


  describe "associations" do 
    before do 
      @user = FactoryGirl.build :user
      @video = FactoryGirl.build :video
      @video_play = FactoryGirl.create :video_play, viewer: @user, watched_video: @video
    end

    it "#user" do 
      expect(@video_play.viewer).to eql @user
    end

    it "#video" do 
      expect(@video_play.watched_video).to eql @video
    end
  end
end
