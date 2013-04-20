class Ordemmusica < ActiveRecord::Base
  attr_accessible :musica_id, :ordem, :repertorio_id
  belongs_to :musicas
  belongs_to :repertorios

  def musica
    Musica.find(musica_id)
  end

  def repertorio
    Repertorio.find(repertorio_id)
  end
end
