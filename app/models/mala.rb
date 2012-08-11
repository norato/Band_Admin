# encoding: utf-8

class Mala < ActiveRecord::Base
  attr_accessible :comprimento, :largura, :nome
  has_and_belongs_to_many :pedais , class_name: 'Pedal'
  has_and_belongs_to_many :alimentacao , class_name:  'Fonte'
  has_many :pedals
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
      pedais.map{|p| p.corrente}.reduce{|soma, n| soma += n}
    end
  end

  def area
    area = largura * comprimento
    if equipamentos.empty?
      area
    else
      area - equipamentos.map { |p| p.area  }.reduce{|soma , n| soma + n}
    end
  end

  def adicionar_fonte(fonte)
    if fonte.largura_util < largura_livre && fonte.comprimento_util < comprimento
      alimentacao << fonte
    else
      "Mala não possue espaço para fonte"
    end
  end

  def equipamentos
    pedais + alimentacao
  end
  
  private 
  def largura_livre
    if pedais.empty?
      largura
    else
      largura_pedais = pedais.map {|p| p.largura_util}.reduce{|soma, n| soma += n}
      largura - largura_pedais
    end
  end
end
