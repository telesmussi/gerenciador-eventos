class Address < ActiveRecord::Base
  attr_accessible :bairro, :cep, :cidade, :complemento, :estado, :logradouro, :numero
  has_one :participant
end
