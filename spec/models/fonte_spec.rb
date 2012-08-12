require 'spec_helper'

describe Fonte do
	it 'retorna as dimensoes' do
		Fonte.new(largura: 100 ,comprimento: 60).dimensoes.should == [100, 60]
	end
  it 'retorna as medidas e a area ocupada' do
    fonte = Fonte.new(largura: 100 ,comprimento: 60)
    fonte.largura_util.should == 110
    fonte.comprimento_util.should == 80
    fonte.area.should == 8800
  end
  it 'verifica a quantidade de saidas' do
    fonte = create(:fonte)
    saida = create(:saida_fonte)
    fonte.adicionar_saida saida
    fonte.saidas.should include(saida)
  end
end
