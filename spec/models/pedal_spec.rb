# encoding: utf-8

require 'spec_helper'

describe Pedal do
  it 'retorna as dimensões do pedal' do
    Pedal.new(largura: 60, comprimento: 125).dimensoes.should == [60, 125]
  end
end