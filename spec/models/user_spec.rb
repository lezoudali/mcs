require 'spec_helper'

describe User do
  before do 
    @user = FactoryGirl.build(:user) 
  end
  
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email)}
  it { should respond_to(:password)}
  it { should respond_to(:password_confirmation)}

  it { should be_valid }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('example@domain.com').for(:email) }

  it "should soft delete" do 
    @user.delete
    @user.deleted_at.should_not be_nil
  end 

  it "should hard delete when passed as argument" do 
    @user.delete(mode: :hard)
    User.count.should eql 0
  end
end
