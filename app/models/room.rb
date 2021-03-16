class Room < ApplicationRecord
    has_many :exhibits
    has_many :paintings, through: :exhibits
end
