# encoding: utf-8

class SaidaFonte < ActiveRecord::Base
  attr_accessible :centro_negativo, :tensao, :fonte, :pedal
  belongs_to :fonte
  belongs_to :pedal
  
  def conectar(pedal)
    if pedal.corrente < fonte.corrente_disponivel && pedal.tensao == tensao
      self.pedal = pedal
    else
      "Corrente do pedal superior ao disponível"
    end
  end

  def corrente_pedal
    pedal.try(:corrente) || 0
  end
end
