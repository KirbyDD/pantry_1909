require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ingredient'
require_relative '../lib/recipe.rb'
require_relative '../lib/cookbook.rb'

class CookbookTest < Minitest::Test 
  def setup
    @cheese = Ingredient.new("Cheese", "oz", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    @cookbook = Cookbook.new
  end

  def test_it_exist
    assert_instance_of Cookbook, @cookbook
  end

  def test_add_recipe_method
    assert_equal [], @cookbook.recipes
    @cookbook.add_recipe(@mac_and_cheese)
    assert_equal [@mac_and_cheese], @cookbook.recipes
  end

  def test_summary_method
    ground_beef = Ingredient.new("Ground Beef", "oz", 100)
    bun = Ingredient.new("Bun", "g", 1)
    burger = Recipe.new("Burger")
    burger.add_ingredient(ground_beef, 4)
    burger.add_ingredient(bun, 100)
    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(burger)

    expected = [{:name=>"Mac and Cheese", :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}}, {:name=>"Burger", :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}], :total_calories=>500}}]
    assert_equal expected, @cookbook.summary
  end

end