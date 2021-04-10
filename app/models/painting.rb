class Painting < ApplicationRecord
    has_many :exhibits
    has_many :rooms, through: :exhibits

end
