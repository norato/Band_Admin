class Mala < ActiveRecord::Base
  attr_accessor :comprimento, :largura, :nome
  has_many :pedals

  def dimensoes
    [largura, comprimento]
  end
end
