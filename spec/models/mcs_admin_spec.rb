require 'spec_helper'

describe McsAdmin do
  before { @mcs_admin = create_mcs_admin }

  subject { @mcs_admin }

  it { should respond_to :user_id}
  it { should validate_presence_of :user_id }
  it { should respond_to :user }
  it { should belong_to :user }
  it { should have_many :videos }

  describe "user association" do 
    before do 
      @user = create_user
      @mcs_admin.user_id = @user.id
    end

    it "returns #user account associated" do 
      expect(@mcs_admin.user).to eql @user
    end
  end

  describe "videos association" do 
    before do 
      2.times { create_video mcs_admin_id: @mcs_admin.id}
    end

    it "should return the number of videos" do 
      expect(@mcs_admin.videos.size).to eql(2)
    end
  end
end
