require 'spec_helper'

describe Comment do
  before do 
    @comment = create_comment content: "nice comment"
  end

  subject { @comment }

  it { should respond_to :user_id }
  it { should respond_to :video_id }
  it { should respond_to :content }

  it { should validate_presence_of :content }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :video_id }
  it { should validate_length_of(:content).is_at_least(1).is_at_most(300)}

  it { should belong_to :user }
  it { should belong_to :video }

  it "returns the content" do 
    expect(@comment.content).to eql "nice comment"
  end

  describe "association" do
    before do 
      @user = create_user
      @video = create_video
      @comment = create_comment user: @user, video: @video
    end

    it "return video" do 
      expect(@comment.video).to eql @video
    end

    it "return user" do 
      expect(@comment.user).to eql @user
    end

    it "return true when passing the right user to #author" do 
      expect(@comment.author?(@user)).to be true
    end
  end 
end
