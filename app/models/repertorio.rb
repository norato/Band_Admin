class Repertorio < ActiveRecord::Base
  attr_accessible :nome
	has_many :ordemmusicas
  has_many :musicas, :through => :ordemmusicas
  has_many :eventos
end
