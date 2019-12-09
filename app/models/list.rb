class List < ApplicationRecord
    has_many :general_lists
    has_many :generals,:through => :general_lists
end
