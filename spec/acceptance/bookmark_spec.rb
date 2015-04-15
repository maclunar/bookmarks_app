require 'spec_helper'

feature "Visitor signs up", js: true do
  scenario "with valid email and password" do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario "with invalid email" do
    sign_up_with 'invalid', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario "with blank password" do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end
end



describe "User" do
  before :each do
    sign_up_with 'bob@example.com', 'apollo11'
  end

  it "logs in and views his bookmark"

  it "logs in and views someone else's bookmark"

  it "logs in and creates a bookmark"

  it "logs in and edits his bookmark"

  it "logs in and edits someone else's bookmark"

  it "logs in and deletes his bookmark"

  it "logs in and deletes someone else's bookmark"

end

describe "Guest" do
  it "views a bookmark"

  it "creates a bookmark"

  it "edits a bookmark"

  it "deletes a bookmark"
end
