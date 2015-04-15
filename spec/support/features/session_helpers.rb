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
  end
end
