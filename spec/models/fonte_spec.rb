# encoding: utf-8

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

  it 'adiciona saidas' do
    fonte = create(:fonte)
    saida = create(:saida_fonte)
    fonte.adicionar_saida saida
    fonte.saidas.should include(saida)
    fonte.saidas.count.should == 1

    saida2 = create(:saida_fonte)
    saida3 = create(:saida_fonte)
    fonte.adicionar_saida saida2
    fonte.adicionar_saida saida3
    fonte.saidas.should include(saida2, saida3)
    fonte.saidas.count.should == 3
  end

  it 'verifica a corrente total e disponível e os pedais plugados' do
    fonte = create(:fonte, corrente:500)
    fonte.corrente_disponivel.should == 500
    fonte.corrente_total.should == 0

    saida1 = create(:saida_fonte)
    fonte.adicionar_saida(saida1)
    pedal1 = create(:pedal, corrente: 200)
    saida1.conectar(pedal1)
    fonte.corrente_disponivel.should == 300
    fonte.corrente_total.should == 200

    saida2 = create(:saida_fonte)
    fonte.adicionar_saida(saida2)
    pedal2 = create(:pedal, corrente: 200)
    saida2.conectar(pedal2)
    fonte.corrente_disponivel.should == 100
    fonte.corrente_total.should == 400

    fonte.pedais.should include(pedal1, pedal2)
  end

  it 'retorna numero de saidas' do
    fonte = create(:fonte)
    fonte.saidas_usadas.should == {}

    saida1 = create(:saida_fonte)
    fonte.adicionar_saida(saida1)
    pedal1 = create(:pedal)
    saida1.conectar(pedal1)

    saida2 = create(:saida_fonte)
    fonte.adicionar_saida(saida2)
    pedal2 = create(:pedal)
    saida2.conectar(pedal2)
    
    fonte.saidas_usadas.should == {9 => 2}

    saida3 = create(:saida_fonte, tensao:12)
    fonte.adicionar_saida(saida3)
    pedal3 = create(:pedal , tensao: 12)
    saida3.conectar(pedal3)

    saida4 = create(:saida_fonte, tensao:18)
    fonte.adicionar_saida(saida4)
    pedal4 = create(:pedal, tensao: 18)
    saida4.conectar(pedal4)

    fonte.saidas_usadas.should == {9 => 2, 12=>1, 18=>1}
  end

  it 'define especificacoes da fonte' do
    fonte = create(:fonte)
    fonte.especificacoes=({9=>10, 12=>1, 18=>2})
    fonte.especificacoes.should == {9=>10, 12=>1, 18=>2}
    fonte.especificacoes_humanizado.should == "10 saidas de 9v, 1 saida de 12v e 2 saidas de 18v"
    
    fonte.especificacoes=({9=>1, 12=>1, 18=>1})
    fonte.especificacoes_humanizado.should == "1 saida de 9v, 1 saida de 12v e 1 saida de 18v"

    fonte.especificacoes=({9=>10, 18=>2})
    fonte.especificacoes_humanizado.should == "10 saidas de 9v e 2 saidas de 18v"

    fonte.especificacoes=({9=>10, 12=>1})
    fonte.especificacoes_humanizado.should == "10 saidas de 9v e 1 saida de 12v"

    fonte.especificacoes=({12=>1})
    fonte.especificacoes_humanizado.should == "1 saida de 12v"
  end


  context 'Número de saidas' do
    it '5 saidas ser o máximo sem definir especificações' do
      fonte = create(:fonte)
      5.times do 
        fonte.adicionar_saida(create(:saida_fonte))
      end
      fonte.saidas.count.should == 5
      lambda{fonte.adicionar_saida(create(:saida_fonte))}.should raise_error
    end
    it 'Após definir as especificacoes pode-se adicionar mais saidas dos tipos especificados' do
      fonte = create(:fonte)
      5.times do 
        fonte.adicionar_saida(create(:saida_fonte))
      end
      fonte.especificacoes=({9=>7})
      2.times do
        fonte.adicionar_saida(create(:saida_fonte))
      end
      fonte.saidas_usadas.should == {9=>7}
      lambda{fonte.adicionar_saida(create(:saida_fonte))}.should raise_error
    end
    it 'retorna as especificações humanizadas pelo número de saídas' do
      fonte = create(:fonte)
        5.times do 
          fonte.adicionar_saida(create(:saida_fonte))
        end
      fonte.especificacoes_humanizado.should == "5 saidas de 9v"
    end
  end
end
