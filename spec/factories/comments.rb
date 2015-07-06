FactoryGirl.define do
  factory :comment do
    content {FFaker::HipsterIpsum.words(30).join(" ")}
    user
    video
  end
end
