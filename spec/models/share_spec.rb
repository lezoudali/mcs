require 'spec_helper'

describe Share do
  let(:share) { create_share }
  subject { share }


  it { should belong_to(:sharer) }
  it { should belong_to(:shared_video) }


  it { should validate_presence_of(:user_id)}
  it { should validate_presence_of(:video_id)}


  describe "associations" do 
    before do 
      @user = create_user
      @video = create_video
      share.user_id = @user.id
      share.video_id = @video.id
    end

    it "#user" do 
      expect(share.sharer).to eql @user
    end

    it "#video" do 
      expect(share.shared_video).to eql @video
    end
  end
end
