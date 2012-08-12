# encoding: utf-8

require 'spec_helper'

describe SaidaFonte do
  it 'verificar saida padrão da fonte' do	
    saida = SaidaFonte.new()
    saida.tensao.should == 9
    saida.centro_negativo.should == true
  end

  it 'conectar somente a um pedal' do
  	saida = SaidaFonte.new()
  	pedal = create(:pedal)
  	saida.conectar(pedal)
  	saida.pedal.should == pedal
    pedal2 = create(:pedal)
    saida.conectar(pedal2)
    saida.pedal.should == pedal2
  end

  it 'informa a conrente do pedal conectado' do
    saida = create(:saida_fonte)
    pedal = create(:pedal)
    saida.conectar(pedal)
    saida.corrente.should == pedal.corrente
  end
end
