class Participant < ActiveRecord::Base
  has_many :credentials
  has_many :events, :through => :credentials
  belongs_to :address
  belongs_to :photo
  belongs_to :company
  attr_accessible :birth, :cpf, :email, :main_phone, :marital_status, :name, :occupation, :secondary_phone, :sex, :surname, :obs1, :obs2, :address_attributes, :company_id
  accepts_nested_attributes_for :address

  validates_presence_of :name
  validates_presence_of :cpf, :unless => :is_enterprise?
  validates_presence_of :company_id, :if => :is_enterprise?
  validates_uniqueness_of :cpf, :allow_blank => true, :allow_nil => true

  def is_enterprise?
    @is_enterprise
  end

  def is_enterprise=(is_enterprise)
    @is_enterprise=is_enterprise
  end

  def self.xls_columns
    { :columns => 
      [ :name, 
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
        ],  
      :headers => 
      [ "Nome", 
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
