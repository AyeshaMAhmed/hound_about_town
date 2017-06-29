class User < ApplicationRecord
  has_secure_password
  
  has_many :pets
  has_many :userplaces
  has_many :places, through: :userplaces
  has_many :votes

end
