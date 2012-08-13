# encoding: utf-8

class Mala < ActiveRecord::Base
  attr_accessible :comprimento, :largura, :nome, :pedais, :fontes
  has_many :pedais
  has_many :fontes

  def dimensoes
    [largura, comprimento]
  end

  def adicionar_pedal(pedal)
    if pedal.largura_util < largura_livre && pedal.comprimento_util < comprimento
      pedais << pedal
    else
      "Mala não possue espaço para pedal"
    end
  end

  def corrente_total
    unless pedais.empty?
      pedais.map(&:corrente).reduce(:+)
    end
  end

  def area
    area = largura * comprimento
    if equipamentos.empty?
      area
    else
      area - equipamentos.map(&:area).reduce(:+)
    end
  end

  def adicionar_fonte(fonte)
    if fonte.largura_util < largura_livre && fonte.comprimento_util < comprimento
      fontes << fonte
    else
      "Mala não possue espaço para fonte"
    end
  end

  def equipamentos
    pedais + fontes
  end
  
  private 
  def largura_livre
    if pedais.empty?
      largura
    else
      largura_pedais = pedais.map(&:largura_util).reduce(:+)
      largura - largura_pedais
    end
  end
end
