class Place < ApplicationRecord

has_many :userplaces
has_many :users, through: :userplaces
has_many :votes

end
