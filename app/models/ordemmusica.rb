class Ordemmusica < ActiveRecord::Base
  attr_accessible :musica_id, :ordem, :repertorio_id
  belongs_to :musicas
  belongs_to :repertorios
end
