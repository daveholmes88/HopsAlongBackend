class AdminNew < ApplicationRecord
    geocoded_by :full_address if ->(obj){ obj.address_changed? }
    after_validation :geocode

    def full_address()
        "#{self.address}, #{self.city} #{self.state}, #{self.country}"
    end 
    
end
