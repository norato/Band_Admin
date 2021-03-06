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
    fonte = create(:fonte, largura: 125, comprimento: 125)
    mala.adicionar_pedal(pedal)
    lambda {mala.adicionar_pedal(pedal2)}.should raise_error
    lambda{mala.adicionar_fonte(fonte)}.should raise_error
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

  it 'redimenciona mala' do
    mala = create(:mala, largura: 300, comprimento:150)
    mala.area.should == 45000
    mala.redimensionar(400,200)
    mala.area.should == 80000
  end

  it 'retorna o nome dos equipamentos' do
    mala = create(:mala)
    fonte = create(:fonte, nome:'Fire Power Bridge Pro')
    mala.adicionar_fonte(fonte)

    mala.lista_equipamentos.should == {'Fonte'=> [["Fire Power Bridge Pro", {"Especificações"=>". Corrente total: 1000mA"}]]}

    ds = create(:pedal, nome:'Fire Distortion', tipo:'Drive')
    mala.adicionar_pedal ds
    drive = create(:pedal, nome:'Fire Drive', tipo:'Drive')
    mala.adicionar_pedal drive
    phaser = create(:pedal, nome:'Furhmann Phaser', tipo:'Modulação')
    mala.adicionar_pedal phaser
    delay = create(:pedal, nome:'Furhmann Delay', tipo:'Repetição')
    mala.adicionar_pedal delay
    boost = create(:pedal, nome:'Fire Boost', tipo:'Boost')
    mala.adicionar_pedal boost

    mala.lista_equipamentos.should == {"Fonte"=>[["Fire Power Bridge Pro", {"Especificações"=>". Corrente total: 1000mA"}]], 
                                       'Drive'=> ['Fire Distortion','Fire Drive'],
                                       'Modulação'=> ['Furhmann Phaser'],
                                       'Repetição'=> ['Furhmann Delay'],
                                       'Boost'=>['Fire Boost']}
  end

  it 'set-up completo' do
    mala = create(:mala, largura:200, comprimento:150)
    fonte = create(:fonte, nome:'Fire Power Bridge Pro',largura:100, comprimento:50, corrente:1000)
    mala.adicionar_fonte(fonte)
    area = mala.area

    # Wah e Whammy em mala separada
    mala_wah_whammy = create(:mala, largura:350, comprimento:320)
    
    # Wah
    wah = create(:pedal, nome:'Wah', tipo: 'Filtro', 
                  largura:150, comprimento:300, corrente:20)
    mala_wah_whammy.adicionar_pedal wah
    saida_wah = create(:saida_fonte)
    # Wah ligada na fonte da mala1
    fonte.adicionar_saida saida_wah
    saida_wah.conectar(wah)


    # Whammy
    whammy = create(:pedal, nome:'Whammy', tipo: 'Picht',
                    largura:160, comprimento:233, tensao:10, corrente:820)
    mala_wah_whammy.adicionar_pedal whammy
    saida_whammy = create(:saida_fonte, tensao:10)
    fonte_whammy = create(:fonte, nome:'Fonte_Whammy', 
                          largura:50, comprimento:50, corrente:1000)
    mala_wah_whammy.adicionar_fonte fonte_whammy
    fonte_whammy.adicionar_saida saida_whammy
    saida_whammy.conectar whammy

    # Distortion
    ds = create(:pedal, nome:'Fire Distortion', tipo:'Drive',
                largura:70, comprimento:110, corrente:20, tensao:18)
    mala.adicionar_pedal ds
    saida_ds = create(:saida_fonte, tensao:18)
    fonte.adicionar_saida saida_ds
    saida_ds.conectar ds
    area -= ds.area
    mala.area.should == area

    # Drive
    drive = create(:pedal, nome:'Fire Drive', tipo:'Drive',
                   largura:70, comprimento:110, corrente:20, tensao:18)
    mala.adicionar_pedal drive
    saida_drive = create(:saida_fonte, tensao:18)
    fonte.adicionar_saida saida_drive
    saida_drive.conectar drive
    area -= drive.area
    mala.area.should == area

    # Phaser
    phaser = create(:pedal, nome:'Furhmann Phaser',tipo:'Modulação',
                    largura:70, comprimento:110, corrente:20)
    
    # Redimenciona Mala
    lambda{mala.adicionar_pedal phaser}.should raise_error
    mala.redimensionar(620,320)
    nova_area = mala.area
    
    mala.adicionar_pedal phaser
    saida_phaser = create(:saida_fonte)
    fonte.adicionar_saida saida_phaser
    saida_phaser.conectar phaser
    nova_area -= phaser.area
    mala.area.should == nova_area

    # Chorus
    chorus = create(:pedal, nome:'Arion Chorus',tipo:'Modulação',
                    largura:70, comprimento:110, corrente:20)
    mala.adicionar_pedal chorus
    saida_chorus = create(:saida_fonte)
    fonte.adicionar_saida saida_chorus
    saida_chorus.conectar chorus
    nova_area -= chorus.area
    mala.area.should == nova_area

    # Tremolo
    tremolo = create(:pedal, nome:'Furhmann Tremolo',tipo:'Repetição',
                      largura:70, comprimento:110, corrente:20)
    mala.adicionar_pedal tremolo
    saida_tremolo = create(:saida_fonte)
    
    # Adiciona especificações para a Fonte
    lambda{fonte.adicionar_saida saida_tremolo}.should raise_error
    fonte.especificacoes=({9=>10, 18=>3})


    fonte.adicionar_saida saida_tremolo
    saida_tremolo.conectar tremolo
    nova_area -= tremolo.area
    mala.area.should == nova_area

    # Delay
    delay = create(:pedal, nome:'Furhmann Delay', tipo:'Repetição',
                    largura:70, comprimento:110, corrente:20)
    mala.adicionar_pedal delay
    saida_delay = create(:saida_fonte)
    fonte.adicionar_saida saida_delay
    saida_delay.conectar delay
    nova_area -= tremolo.area
    mala.area.should == nova_area
    
    # Boost
    boost = create(:pedal, nome:'Fire Boost', tipo:'Boost',
                    largura:70, comprimento:110, corrente:20, tensao:18)
    mala.adicionar_pedal boost
    saida_boost = create(:saida_fonte, tensao:18)
    fonte.adicionar_saida saida_boost
    saida_boost.conectar boost
    nova_area -= boost.area
    mala.area.should == nova_area
    mala.lista_equipamentos.should == {"Fonte"=>[["Fire Power Bridge Pro", 
                                     {"Especificações"=>"10 saidas de 9v e 3 saidas de 18v. Corrente total: 1000mA"}]], 
                                       "Drive"=>["Fire Distortion", "Fire Drive"], 
                                       "Modulação"=>["Furhmann Phaser", "Arion Chorus"], 
                                       "Repetição"=>["Furhmann Tremolo", "Furhmann Delay"], 
                                       "Boost"=>["Fire Boost"]}

    mala_wah_whammy.lista_equipamentos.should == {"Fonte"=>[["Fonte_Whammy", {"Especificações"=>"1 saida de 10v. Corrente total: 1000mA"}]], 
                                                  "Filtro"=>["Wah"], 
                                                  "Picht"=>["Whammy"]}

  end
end
