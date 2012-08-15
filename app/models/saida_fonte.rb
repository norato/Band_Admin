# encoding: utf-8

class SaidaFonte < ActiveRecord::Base
  attr_accessible :centro_negativo, :tensao, :fonte, :pedal
  belongs_to :fonte
  belongs_to :pedal
  
  def conectar(pedal)
    if pedal.corrente >= fonte.corrente_disponivel
      raise "Corrente do pedal superior ao disponível"
    elsif pedal.tensao != tensao
      raise "Tensao do pedal superior ao da saida"
    else
      self.pedal = pedal
    end
  end

  def corrente_pedal
    pedal.try(:corrente) || 0
  end
end
