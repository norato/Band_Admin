# encoding: utf-8

class SaidaFonte < ActiveRecord::Base
  attr_accessible :centro_negativo, :tensao, :fontes
  has_and_belongs_to_many :fontes
  has_one :pedal
  attr_writer :pedal
  attr_reader :pedal

  def conectar(pedal)
    if pedal.corrente < fonte.corrente_disponivel
      self.pedal = pedal
    else
      "Corrente do pedal superior ao disponível"
    end
  end

  def corrente_pedal
    if pedal
      pedal.corrente
    else
      0
    end
  end

  def fonte
    #TODO verificar relacionamento
    fontes[0]
  end
end
