require 'capybara/dsl'

class CartPage
  include Capybara::DSL

  def open_cart
    find('.shopping_cart_link').click
  end

  def remove_product
    click_button 'Remove'
  end

  def empty?
    !has_selector?('.cart_item')
  end

  def continue_shopping
    click_button 'Continue Shopping'
  end

  def proceed_to_checkout
    click_button 'Checkout'
  end
end
