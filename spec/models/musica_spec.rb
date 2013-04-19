# encoding: utf-8
require 'spec_helper'

describe Musica do
  it 'possui como atributos nome, duração, bpm e data' do
  	musica = Musica.new(nome: "Cuervo",
  						duracao: 500,
  						bpm: 120,
  						estilo: "Spanish Rock")
  	musica.nome.should == "Cuervo"
  	musica.duracao.should == 500
  	musica.bpm.should == 120	
  	musica.estilo.should == "Spanish Rock"  
  end
end
