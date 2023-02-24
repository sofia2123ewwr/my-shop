# Create simple user 

FactoryBot.create(:user)

# Create admin user

FactoryBot.create(:user, :is_admin)

#Create categories

category_1 = Category.create!(name: "Game", position: 1)
category_2 = Category.create!(name: "Movie", position: 2)
category_3 = Category.create!(name: "Book", position: 3)

# Create 10 products for each category
[category_1, category_2, category_3].each do |category|
    10.times do |i|
      FactoryBot.create(:product, category: category, position: i + 1)
    end
  end


#Create products

# 10.times do |n|
#     name = Faker::Game.title
#     price = Faker::Commerce.price(range: 100..500)
#     description = Faker::Game.genre
#     position = "#{n+1}"
#     category_id = category_1.position
#     Product.create!(name: name, price: price, description: description, position: position, category_id: category_id)
# end

# 10.times do |n|
#     name = Faker::Movie.title
#     price = Faker::Commerce.price(range: 50..100)
#     description = Faker::Movie.quote
#     position = "#{n+1}"
#     category_id = category_2.position
#     Product.create!(name: name, price: price, description: description, position: position, category_id: category_id)
# end

# 10.times do |n|
#     name = Faker::Book.title
#     price = Faker::Commerce.price(range: 50..150)
#     description = Faker::Book.genre
#     position = "#{n+1}"
#     category_id = category_3.position
#     Product.create!(name: name, price: price, description: description, position: position, category_id: category_id)
# end
