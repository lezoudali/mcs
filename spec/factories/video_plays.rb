FactoryGirl.define do
  factory :video_play do
    watched_video {FactoryGirl.create :video}
    viewer {FactoryGirl.create :user}
  end

end
