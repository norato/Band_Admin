class Evento < ActiveRecord::Base
  attr_accessible :data, :nome, :local_id, :organizador_id
  belongs_to :local
  belongs_to :organizador

  def local
  	Local.find(local_id)
  end

  def organizador
  	Organizador.find(organizador_id)
  end
end
