class Company < ActiveRecord::Base
  attr_accessible :cnpj, :fantasy_name, :name, :cod_cliente, :color
  has_many :participants
  validates_presence_of :cnpj, :name
end