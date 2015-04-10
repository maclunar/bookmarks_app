require 'rspec/rails'
describe Bookmark do
  book = FactoryGirl.build_stubbed(:bookmark)

  it "should have a name 'Bookmark_1" do
    expect(book.name).to eq("Bookmark_1")
  end
end
