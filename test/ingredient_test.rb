require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ingredient'

class IngredientTest < Minitest::Test 
  def setup
    @cheese = Ingredient.new("Cheese", "oz", 50)
  end

  def test_it_exist
    assert_instance_of Ingredient, @cheese
  end

  def test_it_has_a_name
    assert_equal "Cheese", @cheese.name
  end

  def test_it_has_a_unit
    assert_equal "oz", @cheese.unit
  end

  def test_it_has_calories
    assert_equal 50, @cheese.calories
  end
end