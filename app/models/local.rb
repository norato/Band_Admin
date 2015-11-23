class Local < ActiveRecord::Base
  # attr_accessible :cidade, :endereco, :nome, :tipo, :proprietario_id
  belongs_to :proprietario
  has_many :eventos

  def proprietario
  	Proprietario.find(proprietario_id)
  end
end
