require 'capybara/dsl'

class ProductsPage
  include Capybara::DSL

  def product_count
    all('.inventory_item').size
  end

  def add_to_cart(product_name)
    find('.inventory_item', text: product_name).find('button').click
  end

  def sort_by(option)
    find('[data-test="product-sort-container"]').select(option)
  end

  def first_product_name
    first('.inventory_item_name').text
  end

  def get_product_price(product_name)
    find('.inventory_item', text: product_name).find('.inventory_item_price').text
  end
end