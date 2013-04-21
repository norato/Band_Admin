# encoding: utf-8
require 'spec_helper'


describe Local do
  it 'possui como atributos nome, endereço, cidade e tipo' do
    local = Local.new(nome: "Manifesto", 
                  endereco: "R. Iguatemi, 36C - Itaim Bibi", 
                    cidade: "São Paulo",
                      tipo: "Bar")

    local.nome.should == "Manifesto"
    local.endereco.should == "R. Iguatemi, 36C - Itaim Bibi"
    local.cidade.should == "São Paulo"
    local.tipo.should == "Bar"
  end

  it 'pertence a um Proprietário' do
    local = FactoryGirl.create(:local)
    proprietario = FactoryGirl.create(:proprietario)

    local.proprietario_id = proprietario.id
    local.proprietario.nome.should == proprietario.nome
  end

  it 'abriga vários Eventos' do
    local = FactoryGirl.create(:local)

    4.times do
      local.eventos << FactoryGirl.create(:evento)
    end

    local.eventos.count.should == 4
  end
end
