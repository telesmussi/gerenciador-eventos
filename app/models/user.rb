class User < ActiveRecord::Base
  attr_accessible :is_active, :is_admin, :login, :password, :name
  has_many :payments

  validates :name, :login, :presence => true
  validates_uniqueness_of :login, :message => "Login existente!"
  validates_uniqueness_of :name, :message => "Nome existente!"
  validates :password, :length => { :minimum => 4 }
end
