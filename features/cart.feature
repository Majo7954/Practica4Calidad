Feature: Cart functionality in SauceDemo

  Background:
    Given I am on the login page of SauceDemo
    When I login with username "standard_user" and password "secret_sauce"
    And I add a product to the cart
    And I go to the cart page

  @remove
  Scenario: Remove product from the cart
    When I remove the product from the cart
    Then the cart should be empty

  @bvt 
  @continue
  Scenario: Continue shopping from the cart
    When I click on Continue Shopping
    Then I should be redirected to the products page
    And I see the swaglab with 6 differents products and prices.

  @bvt
  @checkout
  Scenario: Proceed to checkout from cart
    When I click on Checkout
    Then I should be taken to the checkout information page
