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

30.times do
    Product.create(
    # а треба тут картинку генерити?
    # Faker::LoremFlickr.image(size: "100x100", search_terms: ['games'])
    name: Faker::Game.title,
    price: Faker::Commerce.price(range: 0..100),
    description: Faker::Game.genre,
    position: Faker::Number.between(from: 1, to: 10),
    # це треба поміняти? на category_id
    category_id: "category_id"
    )
    # Product.create!(name: name, price: price, description: description, position: position, category_id: category_id)
end