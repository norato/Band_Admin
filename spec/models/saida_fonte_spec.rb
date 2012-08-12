# encoding: utf-8

require 'spec_helper'

describe SaidaFonte do
  it 'verificar saida padrão da fonte' do	
    saida = SaidaFonte.new()
    saida.tensao.should == 9
    saida.centro_negativo.should == true
  end

  it 'conectar a um pedal' do
  	saida = SaidaFonte.new()
  	pedal = create(:pedal)
  	saida.conectar(pedal)
  	saida.pedal.should == pedal
  end
end
