class Exhibit < ApplicationRecord
    belongs_to :room
    belongs_to :painting
    #uniqueness scope validation - uniqueness of room id and painting id
    validates :painting, uniqueness: { scope: :room}
end
