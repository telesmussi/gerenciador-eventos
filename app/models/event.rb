class Event < ActiveRecord::Base
  has_many :credentials
  has_many :participants, :through => :credentials
  has_many :rooms
  belongs_to :photo
  attr_accessible :is_active, :name, :is_company_event, :photo_attributes
  validates :name, :presence => true
  accepts_nested_attributes_for :photo
end
