class Pedal < ActiveRecord::Base
  attr_accessor :comprimento, :corrente, :largura, :nome, :tensao, :tipo
  has_and_belongs_to_many :malas
  belongs_to :mala

  def dimensoes
  	[largura, comprimento]
  end

  def area_com_cabo
  	largura_cabo * comprimento_cabo
  end

  def largura_cabo
  	largura + 20
  end

  def comprimento_cabo
  	comprimento + 10
  end
end
