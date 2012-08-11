class Pedal < ActiveRecord::Base
  attr_accessible :comprimento, :corrente, :largura, :nome, :tensao, :tipo
  has_and_belongs_to_many :malas
  belongs_to :mala

  def dimensoes
  	[largura, comprimento]
  end

  def area
  	largura_util * comprimento_util
  end

  def largura_util
  	largura + 20
  end

  def comprimento_util
  	comprimento + 10
  end
end
