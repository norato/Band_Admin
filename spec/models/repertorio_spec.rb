# encoding: utf-8
require 'spec_helper'

describe Repertorio do
  it 'possui como atributo nome' do
  	repertorio = Repertorio.new(nome: "Death Metal")
  	repertorio.nome.should == "Death Metal"	
  end

  it 'pode ser tocado em vários Eventos' do
  	repertorio = FactoryGirl.create(:repertorio)

  	4.times do
  		repertorio.eventos << FactoryGirl.create(:evento)
    end

    repertorio.eventos.count.should == 4
  end
end
