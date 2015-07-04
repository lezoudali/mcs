FactoryGirl.define do
  factory :video do
    title {FFaker::HipsterIpsum.words(5).join(" ")}
    description {FFaker::HipsterIpsum.words(30).join(" ")}
    source_url {FFaker::Internet.http_url}
    mcs_admin
  end

end
