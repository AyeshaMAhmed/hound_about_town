class User < ApplicationRecord
  validates :username, presence: true

  has_secure_password
  
  has_many :pets
  has_many :userplaces
  has_many :places, through: :userplaces
  has_many :votes

  attr_accessor :avatar_file_name

  has_attached_file :avatar,
                    :styles => {:medium => "150x150>", :thumb => "44x44#" },
                    :default_url => "/images/default.png"

  validates_attachment :avatar, :presence => true,
                    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                         :size => { :in => 0..1000.kilobytes }

end
