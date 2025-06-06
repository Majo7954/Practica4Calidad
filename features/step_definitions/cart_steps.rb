Given('I add a product to the cart') do
  visit 'https://www.saucedemo.com/inventory.html'
  find('.btn_inventory', match: :first).click
end

Given('I go to the cart page') do
  find('.shopping_cart_link').click
end

When('I remove the product from the cart') do
  click_button 'Remove'
end

Then('the cart should be empty') do
  expect(page).to have_content('Your Cart')
  expect(page).not_to have_selector('.cart_item')
end

When('I click on Continue Shopping') do
  click_button 'Continue Shopping'
end

Then('I should be redirected to the products page from the cart') do
  expect(page).to have_content('Products')
  expect(page).to have_button('Add to cart')
end

When('I click on Checkout') do
  click_button 'Checkout'
end

Then('I should be taken to the checkout information page') do
  expect(page).to have_content('Checkout: Your Information')
end
