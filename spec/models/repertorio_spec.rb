require 'spec_helper'

describe Repertorio do
  it 'possui como atributo nome' do
  	repertorio = Repertorio.new(nome: "Death Metal")
  	repertorio.nome.should == "Death Metal"	
  end
end
