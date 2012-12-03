class Payment < ActiveRecord::Base
  belongs_to :credential
  belongs_to :user
  has_and_belongs_to_many :rooms
  attr_accessible :amount, :method, :observation, :room_ids
end