class Pet < ApplicationRecord

  belongs_to :user

  has_attached_file :avatar,
                    :styles => { :medium => "150x150>", :thumb => "44x44#" },
                    :default_url => "/images/default.png"

    validates_attachment :avatar,
                         :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                         :size => { :in => 0..1000.kilobytes }

  
end
