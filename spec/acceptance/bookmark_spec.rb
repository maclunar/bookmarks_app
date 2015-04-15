require 'spec_helper'

feature "Visitor signs up" do
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

  scenario "with duplicate email address" do
    sign_up_with 'duplicate@example.com', 'password'
    click_link_or_button 'Sign out'
    sign_up_with 'duplicate@example.com', 'password'
    expect(page).to have_content('Sign in')
  end
end

feature "Visitor signs in and adds a bookmark" do
  scenario "with valid name and url" do
    sign_up_with 'valid_all@example.com', 'password'
    add_bookmark 'test bookmark', 'http://test.example.com/'
    visit bookmarks_path
    click_link('test bookmark')
    expect(page).to have_content('http://test.example.com/')
  end

  scenario "with invalid url" do
    sign_up_with 'invalid_url@example.com', 'password'
    add_bookmark 'test bookmark', 'invalid.url'
    expect(page).to have_content('is invalid')
  end

  scenario "with blank name" do
    sign_up_with 'blank_name@example.com', 'password'
    add_bookmark '', 'http://test.example.com/'
    expect(page).to have_content("can't be blank")
  end

  scenario "with duplicate url" do
    sign_up_with 'duplicate_url@example.com', 'password'
    add_bookmark 'duplicate', 'http://duplicate.example.com/'
    add_bookmark 'duplicate', 'http://duplicate.example.com/'
    expect(page).to have_content("duplicate")
  end
end

