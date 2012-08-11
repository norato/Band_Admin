# encoding: utf-8

class Mala < ActiveRecord::Base
  attr_accessor :comprimento, :largura, :nome
  has_and_belongs_to_many :pedais , class_name: 'Pedal'
  has_many :pedals

  def dimensoes
    [largura, comprimento]
  end

  def adicionar_pedal(pedal)
    if pedal.largura_cabo < largura_livre && pedal.comprimento_cabo < comprimento
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
    if pedais.empty?
      area
    else
      area - pedais.map { |p| p.area_com_cabo  }.reduce{|soma , n| soma + n}
    end
  end
  
  private 
  def largura_livre
    if pedais.empty?
      largura
    else
      largura_pedais = pedais.map {|p| p.largura_cabo}.reduce{|soma, n| soma += n}
      largura - largura_pedais
    end
  end
end
