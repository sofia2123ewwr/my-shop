class Category < ApplicationRecord
    has_many :products, dependent: :destroy

    scope :sort_position, -> { order(position: :desc) }
end
