# encoding: utf-8
require 'spec_helper'

describe Mala do
  it 'retorna as dimensões' do
    Mala.new(largura: 630 , comprimento: 320).dimensoes.should == [630, 320]
  end

  it 'adiciona pedal' do
    mala = create(:mala)
    pedal = create(:pedal)
    pedal2 = create(:pedal)
    mala.adicionar_pedal(pedal)
    mala.adicionar_pedal(pedal2)
    mala.pedais.should include(pedal2, pedal)
  end

  it 'vefifica espaço livre' do
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

  it 'verificar area disponível' do
    mala = create(:mala, largura: 300 , comprimento: 150)
    mala.area.should == 45000
    pedal = Pedal.new(largura: 60, comprimento: 125)
    pedal2 = Pedal.new(largura: 60, comprimento: 125)
    pedal3 = Pedal.new(largura: 60, comprimento: 125)
    mala.adicionar_pedal(pedal)
    mala.adicionar_pedal(pedal2)
    mala.adicionar_pedal(pedal3)
    mala.area.should == 12600
  end

  it 'adiciona fonte' do
    mala = create(:mala, largura: 300 , comprimento: 150)
    fonte = create(:fonte, largura: 100 , comprimento: 60)
    mala.adicionar_fonte(fonte)
    mala.fontes.should include(fonte)
    mala.area.should == 36200
  end
end
