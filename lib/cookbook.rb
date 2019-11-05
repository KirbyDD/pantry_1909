class Cookbook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe recipe
    @recipes << recipe
  end

  def summary
    sum = []
    @recipes.each do |recipe|
      acc = {}
      acc[:name] = recipe.name
      acc[:details] = make_details(recipe)
      sum << acc
    end
    sum
  end

  def make_details recipe
    details = {ingredients: []}
    recipe.ingredients.each do |item|
      acc = {}
      acc[:ingredient] = item.name
      acc[:amount] = "#{recipe.ingredients_required[item]} #{item.unit}"
      details[:ingredients] << acc
    end
    details[:total_calories] = recipe.total_calories
    details
  end
end