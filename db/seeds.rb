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
