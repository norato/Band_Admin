# encoding: utf-8
require 'spec_helper'

describe Mala do
	it 'retorna as dimensões da mala' do
		Mala.new(largura: 320 , comprimento: 630).dimensoes.should == [320 , 630]
	end
end
