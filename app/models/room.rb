class Room < ApplicationRecord
    has_many :exhibits
    has_many :paintings, through: :exhibits
    # validates :username, presence: true, uniqueness: { message: "%{value} is already in use.  Please select another or login."}
end
