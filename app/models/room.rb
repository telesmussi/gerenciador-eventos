class Room < ActiveRecord::Base
  has_many :entrances
  belongs_to :event
  has_and_belongs_to_many :payments
  has_many :credentials, :through => :payments
  has_many :participants, :through => :credentials
  attr_accessible :limit, :name, :price, :event_id
  
  validates :name, :presence => true
  validates_numericality_of :limit, :greater_than => 0
end
