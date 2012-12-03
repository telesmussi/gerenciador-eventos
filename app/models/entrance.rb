class Entrance < ActiveRecord::Base
  belongs_to :credential
  belongs_to :room
  attr_accessible :was_allowed
  has_one :participant, :through => :credential
  
  def self.xls_columns
    { :columns => 
      [ :created_at, 
        :was_allowed, 
        { :participant => 
          [
            :name, 
            :main_phone,
            :email, 
            :cpf, 
            { :company =>
              [ :name,
                :fantasy_name,
                :cnpj,
                :cod_cliente
              ] 
            },
            :occupation, 
            :marital_status, 
            :sex, 
            { :address => 
              [ :cidade, 
                :estado, 
                :cep, 
                :bairro, 
                :logradouro, 
                :numero, 
                :complemento 
              ]  
            }, 
            :obs1, :obs2 
          ]
        }
      ],  
      :headers => 
      [ 'Horario de entrada',
        'Permitido',
        "Nome", 
        "Telefone", 
        "Email", 
        "CPF", 
        "Empresa", 
        "Nome Fantasia",
        "CNPJ",
        "Codigo cliente",
        "Cargo", 
        "Estado Civil", 
        "Sexo", 
        "Cidade", 
        "Estado", 
        "CEP", 
        "Bairro", 
        "Logradouro", 
        "Numero", 
        "Complemento", 
        "Observacao 1", 
        "Observacao 2"
      ] 
    }
  end
end
