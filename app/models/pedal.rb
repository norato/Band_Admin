class Pedal < ActiveRecord::Base
  attr_accessor :comprimento, :corrente, :largura, :nome, :tensao, :tipo
  has_and_belongs_to_many :malas
  belongs_to :mala

  def dimensoes
  	[largura, comprimento]
  end
end
