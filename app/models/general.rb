class General < ApplicationRecord
    validates :name, lengh: {minimum: 4}
    validates :status, presence: true
end
