class Band < ApplicationRecord
    validations :name, presence: {message: "CHRIS MADE ME DO IT" }, uniqueness: true

    #will need to add associations later for albums and tracks/songs
end
