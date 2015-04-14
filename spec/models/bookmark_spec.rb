require 'spec_helper'
describe Bookmark do

  it "is valid with a name and URL" do
    book = FactoryGirl.build(:bookmark)
    book.valid?
    expect(book).to be_valid
  end

  describe "it has validation errors" do
    [:url, :name].each do |attr|
      it "attribute: \"#{attr}\" can't be empty" do
        book = FactoryGirl.build(:bookmark, attr => nil)
        book.valid?
        expect(book.errors[attr]).to include("can't be blank")
      end
    end
  end

  it "is invalid with a duplicate URL" do
    FactoryGirl.create(:bookmark, url: "http://bob.example.com/")
    book = FactoryGirl.build(:bookmark, url: "http://bob.example.com/")
    book.valid?
    expect(book.errors[:url]).to include("has already been taken")
  end


  it "is invalid with invalid URL" do
    book = FactoryGirl.build(:bookmark, url: "invalid.url")
    book.valid?
    expect(book.errors[:url]).to include("is invalid")
  end

  context "after being created" do
    let(:book) { book = FactoryGirl.build(:bookmark) }

    it "can generate a shortened url" do
      book.generate_short_url
      expect(book.shortened_url).not_to eq(nil)
    end

    it "can assign itself to a domain" do
      book.update_domain
      expect(book.domain_id).not_to eq(nil)
    end

    it "can extract a domain from the url" do
      expect(book.extract_domain).to_not eq(nil)
    end
  end

end
