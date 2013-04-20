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
end
