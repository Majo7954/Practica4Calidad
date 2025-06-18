Given('I add a product to the cart') do
  @products_page ||= ProductsPage.new
  visit '/inventory.html'
  @products_page.add_to_cart('Sauce Labs Backpack') # Usa un producto específico
end

Given('I go to the cart page') do
  @cart_page ||= CartPage.new
  @cart_page.open_cart
end

When('I remove the product from the cart') do
  @cart_page ||= CartPage.new
  @cart_page.remove_product
end

Then('the cart should be empty') do
  expect(page).to have_content('Your Cart')
  @cart_page ||= CartPage.new
  expect(@cart_page.empty?).to be true
end

When('I click on Continue Shopping') do
  @cart_page ||= CartPage.new
  @cart_page.continue_shopping
end

Then('I should be redirected to the products page') do
  expect(page).to have_content('Products')
  expect(page).to have_button('Add to cart')
end

When('I click on Checkout') do
  @cart_page ||= CartPage.new
  @cart_page.proceed_to_checkout
end

Then('I should be taken to the checkout information page') do
  expect(page).to have_content('Checkout: Your Information')
end
