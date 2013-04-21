class Evento < ActiveRecord::Base
  attr_accessible :data, :nome, :local_id, :organizador_id, :repertorio_id
  belongs_to :local
  belongs_to :organizador
  belongs_to :repertorio

  def local
  	Local.find(local_id)
  end

  def organizador
  	Organizador.find(organizador_id)
  end

  def repertorio
  	Repertorio.find(repertorio_id)
  end
end
