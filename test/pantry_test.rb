require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ingredient'
require_relative '../lib/recipe.rb'
require_relative '../lib/pantry.rb'

class PantryTest < Minitest::Test 
  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@mac, 8)
    @mac_and_cheese.add_ingredient(@cheese, 2)
  end

  def test_it_exist
    assert_instance_of Pantry, @pantry
  end

  def test_it_has_no_stock
    expected = {}
    assert_equal expected, @pantry.stock
  end

  def test_stock_check_method
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_restock_method
    @pantry.restock(@cheese, 10)
    assert_equal 10, @pantry.stock_check(@cheese)
    @pantry.restock(@cheese, 5)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_enough_ingredients_for_method
    @pantry.restock(@cheese, 5)
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@mac, 5)
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@mac, 3)
    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end