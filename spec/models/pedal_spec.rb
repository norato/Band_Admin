# encoding: utf-8

require 'spec_helper'

describe Pedal do
  it 'retorna as dimensões' do
    Pedal.new(largura: 60, comprimento: 125).dimensoes.should == [60, 125]
  end

  it 'retorna as medidas e area ocupada' do
    pedal = Pedal.new(largura: 60, comprimento: 125)
    pedal.area.should == 10800
		pedal.largura_util.should == 80
		pedal.comprimento_util.should == 135
	end
end