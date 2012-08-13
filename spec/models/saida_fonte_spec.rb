# encoding: utf-8

require 'spec_helper'

describe SaidaFonte do
  it 'verificar saida padrão da fonte' do	
    saida = SaidaFonte.new()
    saida.tensao.should == 9
    saida.centro_negativo.should == true
  end

  it 'conectar somente a um pedal' do
    fonte = create(:fonte)

    saida = SaidaFonte.new()
    fonte.adicionar_saida(saida)
  	pedal = create(:pedal)
  	saida.conectar(pedal)
  	saida.pedal.should == pedal
    pedal2 = create(:pedal)
    saida.conectar(pedal2)
    saida.pedal.should == pedal2
  end

  it 'informa a conrente do pedal conectado' do
    fonte = create(:fonte)
    saida = create(:saida_fonte)
    fonte.adicionar_saida(saida)
    pedal = create(:pedal)
    saida.conectar(pedal)
    saida.corrente_pedal.should == pedal.corrente
  end

  it 'informa qual fonte a saida pertence e corrente' do
    fonte = create(:fonte, corrente:150)

    saida = create(:saida_fonte)
    fonte.adicionar_saida(saida)

    saida.fonte.should == fonte
    saida.fonte.corrente_disponivel.should.should == 150
  end

  it 'corrente disponível para pedal' do
    fonte = create(:fonte, corrente:150)

    saida = create(:saida_fonte)
    fonte.adicionar_saida(saida)
    pedal = create(:pedal, corrente: 200)
    saida.conectar(pedal).should == "Corrente do pedal superior ao disponível"
  end

  it 'pedal com tensao maior não pode ser conectado' do
    fonte = create(:fonte, corrente:150)

    saida = create(:saida_fonte , tensao: 9)
    fonte.adicionar_saida(saida)
    
    pedal = create(:pedal, tensao: 18)
    saida.conectar(pedal).should == "Corrente do pedal superior ao disponível"
  end
end
