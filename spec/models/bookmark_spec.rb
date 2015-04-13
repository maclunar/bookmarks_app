require 'rails_helper'
describe Bookmark do

#  book = FactoryGirl.build_stubbed(:bookmark)
#
#  it "should have a name 'Bookmark_1" do
#    expect(book.name).to eq("Bookmark_1")
#  end

  it "is valid with a name and URL" do
    book = Bookmark.new(
      name: 'Bookmark_1',
      url: 'http://bookmark.example.com/blog/',
    ) 
    expect(book).to be_valid
  end

  it "is invalid without a name" do
    book = Bookmark.new(name: nil)
    book.valid?
    expect(book.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an URL" do
    book = Bookmark.new(url: nil)
    book.valid?
    expect(book.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate URL" do
    Bookmark.create(
      name: "Bob's bookmark",
      url: "http://bob.example.com/blog/",
    )
    book = Bookmark.new(
      name: "Bob's bookmark",
      url: "http://bob.example.com/blog/",
    )
    book.valid?
    expect(book.errors[:url]).to include("has already been taken")
  end

  it "has a valid URL"

  it "is invalid with invalid URL"

  it "can generate a shortened url" do
    book = Bookmark.create(
      name: "Bob's bookmark",
      url: "http://bob.example.com/blog/",
    )
    book.generate_short_url
    expect(book.shortened_url).not_to eq(nil)
  end

  it "can assign itself to a domain" do
    book = Bookmark.create(
      name: "Bob's bookmark",
      url: "http://bob.example.com/blog/",
    )
    book.update_domain 
    expect(book.domain_id).not_to eq(nil)
  end

end
