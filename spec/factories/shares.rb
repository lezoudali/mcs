FactoryGirl.define do
  factory :share do
    video_id 0 
    user_id 0 
    sharer {FactoryGirl.create :user}
    shared_video {FactoryGirl.create(:video)}
  end

end
