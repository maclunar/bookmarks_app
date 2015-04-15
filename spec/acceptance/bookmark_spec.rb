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

feature "Visitor signs in and adds a bookmar", js: true do

  scenario "with valid name and url" do
    sign_up_with 'valid_all@example.com', 'password'

    add_bookmark 'test bookmark', 'http://test.example.com/'

    visit bookmarks_path
    click_link('test bookmark')

    sleep(2)
    expect(page).to have_content('http://test.example.com/')
  end

  scenario "with invalid url" do
    sign_up_with 'invalid_url@example.com', 'password'

    add_bookmark 'test bookmark', 'invalid.url'

    sleep(2)
    expect(page).to have_content('is invalid')
  end

  scenario "with blank name" do
    sign_up_with 'blank_name@example.com', 'password'

    add_bookmark '', 'http://test.example.com/'

    sleep(2)
    expect(page).to have_content("can't be blank")
  end
end

