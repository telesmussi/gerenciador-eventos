class Photo < ActiveRecord::Base
  attr_accessible :description, :image_file_name, :image
  has_one :participant
  has_one :event
  has_attached_file :image, :styles => { :small => "150x150", :large => "550x550", :event_logo => "150x50" }                  
end
