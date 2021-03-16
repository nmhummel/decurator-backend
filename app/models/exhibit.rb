class Exhibit < ApplicationRecord
    belongs_to :room
    belongs_to :painting
end
