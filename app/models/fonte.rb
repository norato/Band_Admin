class Fonte < ActiveRecord::Base
  attr_accessible :corrente, :nome , :comprimento, :largura, :saidas
  has_and_belongs_to_many :malas
  has_and_belongs_to_many :saidas, class_name: 'SaidaFonte'
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
end
