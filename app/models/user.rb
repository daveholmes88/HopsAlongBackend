class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    validates :email, uniqueness:
    has_many :ratings
    has_many :breweries, through: :ratings
end
