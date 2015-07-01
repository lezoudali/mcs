require 'spec_helper'

describe FashionModel do
  before do 
    @fashion_model = FactoryGirl.build(:fashion_model)
  end

  subject { @fashion_model }

  it { should belong_to(:user) }
  it { should respond_to(:instagram) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:instagram) }
  it { should validate_uniqueness_of :user_id}

  it { should be_valid }

  describe "user association" do 
    before do 
      @user = FactoryGirl.create :user
      @fashion_model.user = @user
    end

    it "returns the user associated to the fashion_model" do 
      expect(@fashion_model.user).to eql @user
    end
  end
end
