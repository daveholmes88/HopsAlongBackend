class Tag < ApplicationRecord
    belongs_to :description
    belongs_to :brewery
end
