class Pedal < ActiveRecord::Base
  attr_accessor :comprimento, :corrente, :largura, :nome, :tensao, :tipo
  belongs_to :mala

  def dimensoes
  	[largura, comprimento]
  end
end
