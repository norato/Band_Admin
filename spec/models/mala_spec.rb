# encoding: utf-8
require 'spec_helper'

describe Mala do
	it 'retorna as dimensões da mala' do
		Mala.new(largura: 630 , comprimento: 320).dimensoes.should == [630, 320]
	end

	it 'retorna os pedais que foram adicionados na mala' do
    mala = create(:mala)
    pedal = create(:pedal)
    pedal2 = create(:pedal)
    mala.adicionar_pedal(pedal)
    mala.adicionar_pedal(pedal2)
    mala.pedais.should include(pedal2, pedal)
	end

  it 'retorna o espaço livre da mala' do
    mala = create(:mala , largura: 200, comprimento:150)
    pedal = create(:pedal)
    pedal2 = create(:pedal, comprimento: 135)
    mala.adicionar_pedal(pedal)
    mala.adicionar_pedal(pedal2)
    mala.espaco_livre.should == [40,5]
  end

  it 'verificar espaço livre sem pedal na mala' do
    mala = create(:mala, largura: 200, comprimento:150)
    mala.espaco_livre.should == [200,150]
  end
  
  it 'retorna se mala possue espaço para colocar pedal' do
    mala = create(:mala, largura: 200 , comprimento: 150)
    pedal = Pedal.new(largura: 125, comprimento: 125)
    pedal2 = Pedal.new(largura: 125, comprimento: 125)
    mala.adicionar_pedal(pedal)
    mala.espaco_livre.should == [55,15]
    mala.adicionar_pedal(pedal2).should == "Mala não possue espaço para pedal"
  end
end
