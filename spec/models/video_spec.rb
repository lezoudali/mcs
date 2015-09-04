require 'spec_helper'

describe Video do
  before do 
    @video = create_video
  end
  
  subject { @video }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:source_url) }
  it { should respond_to(:views) }
  it { should respond_to(:mcs_admin_id) }
  it { should respond_to(:comments) }
  it { should respond_to(:index_num) }
  it { should respond_to(:poster_image_url) }
  it { should respond_to(:fashion_model_name) }
  it { should respond_to(:video_likes)}
  it { should respond_to(:num_likes)}
  it { should respond_to(:num_comments)}
  it { should respond_to(:num_shares)}

  it { should belong_to(:mcs_admin) }


  it { should be_valid }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:source_url) }
  it { should validate_uniqueness_of(:source_url) }
  it { should validate_presence_of(:mcs_admin_id)}
  it { should validate_presence_of(:index_num)}
  it { should validate_uniqueness_of(:index_num)}
  it { should validate_presence_of(:poster_image_url) }
  it { should validate_uniqueness_of(:poster_image_url)}
  it { should validate_presence_of(:fashion_model_name)}



  it { should have_many(:shares) }
  it { should have_many(:comments)}
  it { should have_many(:sharers) }

  it "should default views to 0" do 
    expect(@video.views).to eql 0
  end

  # it "should soft delete" do 
  #   @video.delete
  #   @video.deleted_at.should_not be_nil
  # end

  it "should hard delete when passed as argument" do 
    @video.delete #(mode: :hard)
    Video.count.should eql 0
  end

  describe "sharings associations" do 
    before do 
      @user = create_user
      create_share sharer: @user, shared_video: @video
      create_share sharer: create_user, shared_video: @video
    end

    it "returns #users who shared the video" do 
      expect(@video.sharers).to include(@user)
    end

    it "returns number of sharers" do 
      expect(@video.num_shares).to eql 2
    end
  end


  describe "#video_likes association" do 
    before do 
      @likes = 4.times.map { FactoryGirl.create :video_like, video: @video }
    end

    it "return videos liked" do 
      expect(@video.video_likes).to eq @likes
    end

    it "return #num_likes" do 
      expect(@video.num_likes).to eq 4
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

  describe "comments association" do 
    before do 
      @video = create_video 
      @comments = Array.new(4) { create_comment(video_id: @video.id) }
    end

    it "associates the comments to the video" do 
      expect(@video.comments).to include @comments.first
    end

    it "destroys the associated comments on self destruct" do 
      comments = @video.comments
      @video.destroy
      comments.each do |comment|
        expect(Comment.find(comment.id)).to raise_error ActiveRecord::RecordNotFound
      end
    end

    it "returns the num_comments" do
      expect(@video.num_comments).to eql 4
    end
  end
end
