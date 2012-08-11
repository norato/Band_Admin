# encoding: utf-8

require 'spec_helper'

describe Pedal do
  it 'retorna as dimensões do pedal' do
    Pedal.new(largura: 60, comprimento: 125).dimensoes.should == [60, 125]
  end

  it 'retorna a area com os cabos' do
  	Pedal.new(largura: 60, comprimento: 125).area_com_cabo.should == 10800
  end

  it 'retorna as medidas com os cabos' do
		Pedal.new(largura: 60, comprimento: 125).largura_cabo.should == 80
		Pedal.new(largura: 60, comprimento: 125).comprimento_cabo.should == 135
	end
end