class Brewery < ApplicationRecord
    has_many :ratings
    has_many :users, through: :ratings
    has_many :tags
    has_many :descriptions, through: :tags 
    geocoded_by :full_address
    after_validation :geocode

    def full_address()
        "#{self.address}, #{self.city} #{self.state}, #{self.country}"
    end 
end
