Then('I see the swaglab with {int} differents products and prices.') do |expected_count|
  @products_page ||= ProductsPage.new
  expect(@products_page.product_count).to eq(expected_count)
end

Given('I am on the login page of SauceDemo') do
  @login_page = LoginPage.new
  @login_page.open
end

When('I login with username {string} and password {string}') do |username, password|
  @login_page ||= LoginPage.new
  @login_page.login(username, password)
end

Then('I should be redirected to the inventory page') do
  expect(page).to have_current_path('/inventory.html')
end

Then('I should not be redirected to the inventory page') do
  expect(page).not_to have_current_path('/inventory.html')
end

Then('I should see an error message {string}') do |expected_message|
  expect(@login_page.error_message).to eq(expected_message)
end

Then('I should remain on the login page') do
  expect(page).to have_current_path('/')
end

When('I reload the page') do
  visit current_url
end

Given('I am on the login page') do
  step 'I am on the login page of SauceDemo'
end


