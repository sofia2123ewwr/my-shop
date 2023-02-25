FactoryBot.define do
    factory :product do
        name { Faker::Commerce.product_name }
        price { Faker::Commerce.price(range: 100..1000) }
        description { Faker::Lorem.paragraph(sentence_count: 5) }
        category { association :category }
        position { nil }
    end
end

