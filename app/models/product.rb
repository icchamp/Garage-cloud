class Product < ApplicationRecord
    belongs_to :user
    attachment :image
end
