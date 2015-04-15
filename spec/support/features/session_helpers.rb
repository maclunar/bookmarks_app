module Features
  module SessionHelpers
    def sign_in_with(email, password)
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Log in'
    end

    def sign_up_with(email, password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end
  end

  module BookmarkHelpers
    def add_bookmark(name, url)
      visit new_bookmark_path
      fill_in 'Name', with: name
      fill_in 'Url', with: url
      click_button 'Create Bookmark'
    end

    def delete_bookmark(name)
      visit bookmarks_path
      click_link(name)
      sleep(3)
      click_link_or_button 'Delete'
      sleep(3)
      page.driver.browser.switch_to.alert.accept
    end
  end
end
