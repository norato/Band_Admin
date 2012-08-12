class SaidaFonte < ActiveRecord::Base
  attr_accessible :centro_negativo, :tensao
  has_and_belongs_to_many :fontes
  has_one :pedal
  attr_writer :pedal
  attr_reader :pedal

  def conectar(pedal)
 	  self.pedal = pedal
  end

  def corrente
  	pedal.corrente
  end
end
