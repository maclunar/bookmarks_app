require 'spec_helper'
require 'rails_helper'
describe "the searching process" do
  context "there are 3 bookmarks, 2 of which share passphrase 'onet'." do
    before(:each) do
      FactoryGirl.create(:bookmark)
      2.times { FactoryGirl.create(:bookmark_onet) }
    end
    
    it "searches for a phrase 'onet'"
#      visit 'root_path'
#      page.find_by_css('.form-control type="text"')
#      fill_in 'text', :with => 'onet'
#      click_button 'Go!'
#      expect(page).to have_content 'onet'
#    end

    it "searches for a 'dot' sign"

    it "searches for a phrase 'post'"
  end
end
