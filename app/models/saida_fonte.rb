class SaidaFonte < ActiveRecord::Base
  attr_accessible :centro_negativo, :tensao
  has_one :pedal

  def conectar(pedal)
  	self.pedal = pedal
  end
end
