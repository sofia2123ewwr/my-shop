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

Category.create!(name: "Game", position: 1)

# Product.create!(name: "Demo", price: 100, description: "description", position: 1, category: Category.find_by(name: "Game"))

10.times do |n|
    # а треба тут картинку генерити?
    # Faker::LoremFlickr.image(size: "100x100", search_terms: ['games'])
    name = Faker::Game.title
    price = Faker::Commerce.price(range: 0..100)
    description = Faker::Game.genre
    position = "#{n+1}"
    # це треба поміняти? на category_id
    category = Category.find_by(name: "Game")
    Product.create!(name: name, price: price, description: description, position: position, category: category)
end