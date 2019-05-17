require 'json'
require 'open-uri'

Ingredient.destroy_all

puts 'Creating cocktails...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = JSON.parse(open(url).read)

response['drinks'].each do |x|
  Ingredient.create(name: x['strIngredient1'])
end

Cocktail.destroy_all

cocktail_attributes = [
  {
    name: 'Martini'
  },
  {
    name: 'Manhattan'
  },
  {
    name: 'Bloody Mary'
  },
  {
    name: 'Margarita'
  },
  {
    name: 'Old Fashioned'
  },
  {
    name: 'Mojito'
  },
  {
    name: 'Daquiri'
  },
  {
    name: 'Gin Tonic'
  }
]
Cocktail.create!(cocktail_attributes)

puts 'Finished!'
