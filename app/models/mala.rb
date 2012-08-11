# encoding: utf-8

class Mala < ActiveRecord::Base
  attr_accessor :comprimento, :largura, :nome
  has_and_belongs_to_many :pedais , class_name: 'Pedal'
  has_many :pedals

  def dimensoes
    [largura, comprimento]
  end

  def adicionar_pedal(pedal)
    if pedal_cabo(pedal)[0] < largura_livre && pedal_cabo(pedal)[1] < comprimento
      pedais << pedal
    else
      "Mala não possue espaço para pedal"
    end
  end

  def espaco_livre
    [largura_livre, comprimento_livre]
  end
  
  def largura_livre
    if pedais.empty?
      largura
    else
    	espaco_para_cabo = 20
    	largura_pedais = pedais.map {|p| p.largura + espaco_para_cabo}.reduce{|soma, n| soma += n}
    	largura - largura_pedais
    end
  end

  def comprimento_livre
    if pedais.empty?
      comprimento
    else
    	espaco_para_cabo = 10
    	comprimento_pedais = pedais.map{|p| p.comprimento}.max
    	comprimento - (comprimento_pedais + espaco_para_cabo)
    end
  end

  def pedal_cabo(pedal)
    [pedal.largura + 20 , pedal.comprimento + 10 ]
  end
end
