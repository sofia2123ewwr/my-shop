# Create simple user
User.create!(first_name: "Sofiia", 
            last_name: "Shkilna", 
            phone: "380665154604", 
            email: "schoolgirl4991@gmail.com", 
            password: "sofiiaa", 
            password_confirmation: "sofiiaa")

# Create admin user
User.create!(first_name: "Nikita", 
            last_name: "Shkilna",  
            phone: "380665154600", 
            email: "nikita4991@gmail.com", 
            password: "nikita", 
            password_confirmation: "nikita",
            is_admin: true)
# Create categories
# previous version category
category_1 = Category.create!(name: "Game", position: 1)
category_2 = Category.create!(name: "Movie", position: 2)
category_3 = Category.create!(name: "Book", position: 3)

10.times do |n|
    # а треба тут картинку генерити?
    # Faker::LoremFlickr.image(size: "100x100", search_terms: ['games'])
    name = Faker::Game.title
    price = Faker::Commerce.price(range: 100..500)
    description = Faker::Game.genre
    position = "#{n+1}"
    # це треба поміняти? на category_id
    category_id = 1
    Product.create!(name: name, price: price, description: description, position: position, category_id: category_id)
end

10.times do |n|
    # а треба тут картинку генерити?
    # Faker::LoremFlickr.image(size: "100x100", search_terms: ['games'])
    name = Faker::Movie.title
    price = Faker::Commerce.price(range: 50..100)
    description = Faker::Movie.quote
    position = "#{n+1}"
    # це треба поміняти? на category_id
    category_id = 2
    Product.create!(name: name, price: price, description: description, position: position, category_id: category_id)
end

10.times do |n|
    # а треба тут картинку генерити?
    # Faker::LoremFlickr.image(size: "100x100", search_terms: ['games'])
    name = Faker::Book.title
    price = Faker::Commerce.price(range: 50..150)
    description = Faker::Book.genre
    position = "#{n+1}"
    # це треба поміняти? на category_id
    category_id = 3
    Product.create!(name: name, price: price, description: description, position: position, category_id: category_id)
end
