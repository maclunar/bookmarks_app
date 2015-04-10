FactoryGirl.define do

  factory :bookmark do
    sequence(:name) { |i| "Bookmark_#{i}" }
    sequence(:url) { |j| "http://example.com/site_#{j}" }

    factory :bookmark_with_domain do
      association :domain
    end
  end
end
