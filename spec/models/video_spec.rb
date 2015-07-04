require 'spec_helper'

describe Video do
  before do 
    @video = create_video
  end
  
  subject { @video }

  it { should respond_to(:title)}
  it { should respond_to(:description)}
  it { should respond_to(:source_url)}
  it { should respond_to(:views)}
  it { should belong_to(:mcs_admin) }
  it { should respond_to(:mcs_admin_id)}

  it { should be_valid }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:source_url) }
  it { should validate_uniqueness_of(:source_url) }
  it { should validate_presence_of(:mcs_admin_id)}

  it { should have_many(:shares) }
  it { should have_many(:sharers) }

  it "should default views to 0" do 
    expect(@video.views).to eql 0
  end

  it "should soft delete" do 
    @video.delete
    @video.deleted_at.should_not be_nil
  end

  it "should hard delete when passed as argument" do 
    @video.delete(mode: :hard)
    Video.count.should eql 0
  end

  describe "viewers associations" do 
    before do 
      @user = create_user
      @video_play = create_share sharer: @user, shared_video: @video
    end

    it "returns #users who shared the video" do 
      expect(@video.sharers).to include(@user)
    end
  end

  describe "mcs_admin association" do 
    before do
      @mcs_admin = create_mcs_admin
      @video.mcs_admin_id = @mcs_admin.id
    end

    it "should return the admin" do 
      expect(@video.mcs_admin).to eql(@mcs_admin)
    end
  end

  describe "fashion_models association" do
    before do 
      @video.save
      @fashion_models_video = create_fashion_models_video video: @video
    end

    it "returns the correct amount of videos" do 
      expect(@video.fashion_models.size).to eql(1)
    end 
  end
end
