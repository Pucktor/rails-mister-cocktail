require 'json'
require 'open-uri'

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ing_serialized = open(url).read
ingredients = JSON.parse(ing_serialized)
ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
  puts "created #{ingredient['strIngredient1']}"
end
i1 = Ingredient.create!(name: 'cacao powder')
i2 = Ingredient.create!(name: 'brown sugar')
i3 = Ingredient.create!(name: 'cheap vodka')
i4 = Ingredient.create!(name: 'cheap rhum')
i5 = Ingredient.create!(name: 'cokaine')
i6 = Ingredient.create!(name: 'manu juice')

puts "All done !"

Cocktail.destroy_all
c1 = Cocktail.create!(name: "Devil's kiss")
c2 = Cocktail.create!(name: "Le mortier")
c3 = Cocktail.create!(name: "Sex on the Manu")

Dose.destroy_all
d1 = { description: "6 cl", ingredient: i1, cocktail: c1 }
d2 = { description: "2 mg", ingredient: i2, cocktail: c1 }
d3 = { description: "1 L", ingredient: i3, cocktail: c2 }
d4 = { description: "2 L", ingredient: i4, cocktail: c2 }
d5 = { description: "20 g", ingredient: i5, cocktail: c3 }
d6 = { description: "2 cl", ingredient: i6, cocktail: c3 }

[d1, d2, d3, d4, d5, d6].each do |attr|
  Dose.create!(attr)
end

