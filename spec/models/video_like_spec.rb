require 'spec_helper'

describe VideoLike do
  before do 
    @user = create_user
    @video = create_video
    @video_like = create_video_like user: @user, video: @video
  end

  subject { @video_like }

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :video_id }
  it { should respond_to :user }
  it { should respond_to :video }

  describe "associations" do 
    it "#user" do 
      @video_like.user.should eql @user
    end

    it "#video" do 
      @video_like.video.should eql @video
    end
  end 
end
