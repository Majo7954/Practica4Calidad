Feature: Navegación y ordenamiento de productos

  Background:
    Given I am on the login page of SauceDemo
    When I login with username "standard_user" and password "secret_sauce"
    Then I should be on the products page
    
  @bvt 
  @view
  Scenario: Ver productos listados
    Then I should see a list of available products

  @view
  Scenario: Ver todos los productos
    Then I should see exactly 6 products listed

  @info
  Scenario: Ver información de los productos
    Then I should see the product "Sauce Labs Backpack" with price "$29.99"
    And I should see the product "Sauce Labs Bike Light" with price "$9.99"
  @bvt 
  @add
  Scenario: Agregar un solo producto al carrito
    When I add the product "Sauce Labs Backpack" to the cart
    Then the cart icon should show "1"

  @add
  Scenario: Agregar múltiples productos al carrito
    When I add the product "Sauce Labs Backpack" to the cart
    And I add the product "Sauce Labs Bolt T-Shirt" to the cart
    Then the cart icon should show "2"

  @bvt 
  @sort
  Scenario Outline: Ordenar productos por <criterio>
    When I sort the products by "<criterio>"
    Then the first product should be "<producto_esperado>"

    Examples:
      | criterio              | producto_esperado        |
      | Name (A to Z)         | Sauce Labs Backpack      |
      | Price (low to high)   | Sauce Labs Onesie        |
      | Name (Z to A)         | Test.allTheThings() T-Shirt (Red) |
      | Price (high to low)   | Sauce Labs Fleece Jacket |
