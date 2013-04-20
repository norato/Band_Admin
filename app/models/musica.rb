class Musica < ActiveRecord::Base
  attr_accessible :bpm, :duracao, :estilo, :nome
  has_many :ordemmusicas
  has_many :repertorios, :through => :ordemmusicas
end
