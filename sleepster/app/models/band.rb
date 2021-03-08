class Band < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    #will need to add associations later for albums and tracks/songs
end
