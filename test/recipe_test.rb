require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ingredient'

class IngredientTest < Minitest::Test 
  def setup
    @cheese = Ingredient.new("Cheese", "oz", 50)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exist
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_it_has_a_name
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_it_starts_with_no_ingredients_required
    assert_equal {}, @mac_and_cheese.ingredients_required
  end

  def test_add_ingredient_method
    @mac_and_cheese.add_ingredient(@cheese, 2)
    assert_equal {@cheese => 2}, @mac_and_cheese.ingredients_required
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal {@cheese => 2, @mac => 8}, @mac_and_cheese.ingredients_required
  end

  def test_amount_required_method
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end

  def test_it_has_list_of_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    assert_equal [@cheese], @mac_and_cheese.ingredients
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal [@cheese, @mac], @mac_and_cheese.ingredients
  end

  def test_total_calories_method
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 440, @mac_and_cheese.total_calories
  end
end