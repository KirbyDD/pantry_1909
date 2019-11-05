class Recipe
  attr_reader :name, :ingredients_required, :ingredients 

  def initialize(name)
    @name = name
    @ingredients_required = {}
    @ingredients = []
  end

  def add_ingredient(item, amount)
    @ingredients_required[item] = amount
    @ingredients << item
  end

  def amount_required item
    @ingredients_required[item]
  end

  def total_calories
    total = 0
    @ingredients.each do |item|
      total += @ingredients_required[item] * item.calories
    end
    total
  end
end