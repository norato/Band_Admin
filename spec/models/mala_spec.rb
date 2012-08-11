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

  it 'retorna se mala possue espaço para colocar pedal' do
    mala = create(:mala, largura: 200 , comprimento: 150)
    mala.area.should == 30000
    pedal = Pedal.new(largura: 125, comprimento: 125)
    pedal2 = Pedal.new(largura: 125, comprimento: 125)
    mala.adicionar_pedal(pedal)
    mala.adicionar_pedal(pedal2).should == "Mala não possue espaço para pedal"
  end

  it 'verificar a corrente total dos pedais' do
    mala = create(:mala)
    mala.corrente_total.should == nil
    pedal1 = create(:pedal, corrente: 200)
    pedal2 = create(:pedal, corrente: 200)
    pedal3 = create(:pedal, corrente: 200)
    mala.adicionar_pedal(pedal1)
    mala.adicionar_pedal(pedal2)
    mala.adicionar_pedal(pedal2)
    mala.corrente_total.should == 600
  end

  it 'verificar area disponível na mala' do
    mala = create(:mala, largura: 300 , comprimento: 150)
    mala.area.should == 45000
    pedal = Pedal.new(largura: 60, comprimento: 125)
    pedal2 = Pedal.new(largura: 60, comprimento: 125)
    pedal3 = Pedal.new(largura: 60, comprimento: 125)
    mala.adicionar_pedal(pedal)
    mala.adicionar_pedal(pedal2)
    mala.adicionar_pedal(pedal3)
    # area de cada pedal com cabo (60 + 20) * (125 +10) = 10800mm
    # area 3 pedais 32400mm
    mala.area.should == 12600
  end
end
