class Description < ApplicationRecord
    has_many :tags
    has_many :breweries, through: :tags
end
