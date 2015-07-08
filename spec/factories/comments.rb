FactoryGirl.define do
  factory :comment do
    content {FFaker::HipsterIpsum.words(10).join(" ")}
    user
    video
  end
end
