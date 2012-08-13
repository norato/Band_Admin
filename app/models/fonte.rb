class Fonte < ActiveRecord::Base
  attr_accessible :corrente, :nome , :comprimento, :largura, :saidas
  has_many :saidas, class_name: 'SaidaFonte'
  belongs_to :mala

  def dimensoes
    [largura , comprimento]
  end

  def largura_util
  	largura + 10
  end

  def comprimento_util
  	comprimento + 20
  end

  def area
  	largura_util * comprimento_util
  end

  def adicionar_saida(saida)
    saidas << saida
  end

  def corrente_disponivel
    corrente - corrente_total
  end

  def corrente_total
    if saidas.empty?
      0
    else
      saidas.map(&:corrente_pedal).reduce(:+)


    end
  end

  def pedais
    saidas.map(&:pedal)
  end
end