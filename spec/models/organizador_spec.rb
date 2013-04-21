# encoding: utf-8
require 'spec_helper'

describe Organizador do
  it 'possui como atributos nome e contato' do
  	organizador = Organizador.new(nome: "Dedé Muylaert", contato: "dede_muylaert@foo.com")
  	organizador.nome.should == "Dedé Muylaert"
  	organizador.contato.should == "dede_muylaert@foo.com"
  end

  it 'pode organizar vários Eventos' do
    organizador = FactoryGirl.create(:organizador)

    4.times do
      organizador.eventos << FactoryGirl.create(:evento)
    end

    organizador.eventos.count.should == 4
  end
end
