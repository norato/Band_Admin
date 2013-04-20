# encoding: utf-8
require 'spec_helper'

describe Ordemmusica do
	it 'possui como atributos ordem, musica_id e repertorio_id' do
	  repertorio = FactoryGirl.create(:repertorio)
	  musica = FactoryGirl.create(:musica)
	  ordemmusica = Ordemmusica.new(ordem: 1, 
	  							musica_id: musica.id, repertorio_id: repertorio.id)
	  ordemmusica.ordem.should == 1
	  ordemmusica.musica_id.should == musica.id
	  ordemmusica.repertorio_id.should == repertorio.id
	end

	it 'retorna o nome da música' do
	  repertorio = FactoryGirl.create(:repertorio)
	  musica = FactoryGirl.create(:musica)
	  ordemmusica = Ordemmusica.new(ordem: 1, 
	  							musica_id: musica.id, repertorio_id: repertorio.id)
	  ordemmusica.musica.nome.should == musica.nome
	end
	it 'retorna o nome da repertório' do
	  repertorio = FactoryGirl.create(:repertorio)
	  musica = FactoryGirl.create(:musica)
	  ordemmusica = Ordemmusica.new(ordem: 1, 
	  							musica_id: musica.id, repertorio_id: repertorio.id)
	  ordemmusica.repertorio.nome.should == repertorio.nome
	end

end
