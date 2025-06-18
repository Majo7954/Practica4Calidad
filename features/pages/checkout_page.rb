class CheckoutPage
  include Capybara::DSL

  def fill_information(first_name, last_name, postal_code)
    fill_in 'first-name', with: first_name
    fill_in 'last-name', with: last_name
    fill_in 'postal-code', with: postal_code
  end

  def continue
    click_button 'Continue'
  end

  def cancel
    click_button 'Cancel'
  end

  def finish
    click_button 'Finish'
  end

  def confirmation_message
    find('.complete-header').text
  end

  def complete_checkout_info(first_name, last_name, postal_code)
  fill_information(first_name, last_name, postal_code)
  continue
  end

  def on_complete_page?
  has_content?('Thank you for your order!')
  end
end
