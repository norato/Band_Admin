# encoding: utf-8
require 'spec_helper'

describe Proprietario do
  it 'possui como atributos nome e contato' do
  	proprietario = Proprietario.new(nome: "Alisson Zakka", contato: "zakka_guitarista@gmail.com")
  	proprietario.nome.should == "Alisson Zakka"
  	proprietario.contato.should == "zakka_guitarista@gmail.com"
  end

  it 'possui vários Locais' do
  	proprietario = FactoryGirl.create(:proprietario)
  	4.times do |num|
      proprietario.locais << FactoryGirl.create(:local)
    end

    proprietario.locais.count.should == 4
  end
end
