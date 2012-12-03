class Estado < ActiveRecord::Base
    attr_accessible :uf, :nome
    
    def self.hash_map
      Hash[Estado.all.map{ |b| [b.nome, b.nome] }]
    end
    
end