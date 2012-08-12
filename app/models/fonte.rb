class Fonte < ActiveRecord::Base
  attr_accessible :corrente, :nome , :comprimento, :largura
  has_and_belongs_to_many :malas
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
end