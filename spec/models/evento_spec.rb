require 'spec_helper'

describe Evento do
  it 'possui como atributos nome e data' do
  	evento = Evento.new(nome: "Festival de Bandas de Garagem",
  						data: "13/06/2013")
  	evento.nome.should == "Festival de Bandas de Garagem"
  	evento.data.should == "13/06/2013"  
  end
end
