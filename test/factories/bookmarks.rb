FactoryGirl.define do
  factory :bookmark do
    name "Bob's Blog"
    sequence(:url, 100) { |i| "http://bob.example.com/blog/post_#{i}" }
  end

  factory :onet do
    name "Onet"
    sequence(:url, 100) { |i| "http://wiadomosci.onet.pl/wroclaw/post_#{i}" }
  end

end
