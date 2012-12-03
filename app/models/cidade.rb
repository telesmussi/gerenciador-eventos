class Cidade < ActiveRecord::Base
    attr_accessible :estado, :uf, :nome
    
    def self.hash_map_for(participant)
      participant && 
      participant.address.estado && 
      participant.address.estado.length > 0 ? #se participant possui estado, preenche select das cidades para aquele estado
        Cidade.where(:uf => Estado.where(:nome => participant.address.estado).first.uf).map{ |b| [b.nome, b.nome] } 
        : [] #se nao possui estado, retorna coleçao vazia
    end
    
end