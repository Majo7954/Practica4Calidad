# features/pages/login_page.rb

class LoginPage
  include Capybara::DSL

  def open
    visit('https://www.saucedemo.com/')
  end

  def login(username, password)
    fill_in 'user-name', with: username
    fill_in 'password', with: password
    click_button 'Login'
  end

  def error_message
    find('[data-test="error"]').text
  end

  def title
    find('.login_logo').text
  end
end
