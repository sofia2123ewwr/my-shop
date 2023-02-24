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