class Upload < ActiveRecord::Base
  belongs_to :user
  has_attached_file :file
  attr_accessible :file
end
