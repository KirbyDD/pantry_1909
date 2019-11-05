class Pantry
  attr_reader :stock
  def initialize
    @stock = {}
  end

  def stock_check item
    if @stock[item]
      @stock[item]
    else
      0
    end
  end

  def restock item, amount
    if @stock[item]
      @stock[item] += amount
    else
      @stock[item] = amount
    end
  end

  def enough_ingredients_for? recipe
    results = []
    recipe.ingredients_required.keys.each do |key|
      # require 'pry'; binding.pry
      if @stock[key]
        results << (@stock[key] >= recipe.ingredients_required[key])
      else
        results << false
      end 
    end
    results.all?
  end
end