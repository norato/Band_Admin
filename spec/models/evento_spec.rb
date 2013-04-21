# encoding: utf-8
require 'spec_helper'

describe Evento do
  it 'possui como atributos nome e data' do
    evento = Evento.new(nome: "Festival de Bandas de Garagem",
              data: "13/06/2013")
    evento.nome.should == "Festival de Bandas de Garagem"
    evento.data.should == "13/06/2013"  
  end

  it 'é realizado em um Local' do
    local = FactoryGirl.create(:local)
    evento = FactoryGirl.create(:evento)

    evento.local_id = local.id
    evento.local.nome.should == local.nome
  end

  it 'é organizado por um Organizador' do
    local = FactoryGirl.create(:local)
    organizador = FactoryGirl.create(:organizador)

    evento.organizador_id = organizador.id
    evento.organizador.nome.should == organizador.nome
  end
end
