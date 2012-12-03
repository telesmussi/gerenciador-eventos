class Credential < ActiveRecord::Base
  has_many :payments
  has_many :entrances
  has_many :rooms, :through => :payments
  belongs_to :participant
  belongs_to :event
  attr_accessible :bar_code
  
  def generate_bar_code
    if Credential.all.count > 0
      last_bar_code = Credential.maximum(:bar_code)
    else
      last_bar_code = 100
    end
    self.bar_code = (last_bar_code + rand(50) + rand(50) + 1)
  end

end
