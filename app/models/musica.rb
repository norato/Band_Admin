class Musica < ActiveRecord::Base
  attr_accessible :bpm, :duracao, :estilo, :nome
end
