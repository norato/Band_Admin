require 'spec_helper'
require 'mime/types'
require 'nokogiri'

describe DocumentoOdt do

  it 'cria um novo documento odt' do
    documento = DocumentoOdt.new('arquivo')
    documento.arquivo.should == "#{Rails.root}/tmp/arquivo.odt"
    MIME::Types.type_for(documento.arquivo)[0].should == "application/vnd.oasis.opendocument.text"
    File.delete(documento.arquivo)
  end

  it 'adiciona uma imagem ao documento' do
    documento = DocumentoOdt.new('imagem')
    imagem = File.read("#{Rails.root}/spec/resources/pedalcartoons3.png")
    documento.adicionar_imagem(imagem, "pedalcartoons3.png")
    documento.salvar!
    odt = ZipFile.open(documento.arquivo)
    !odt.read("Pictures/pedalcartoons3.png").empty?
    File.delete(documento.arquivo)
  end

  it 'adiciona mais de uma imagem ao documento' do
    documento = DocumentoOdt.new('duas_imagens')
    imagem = File.read("#{Rails.root}/spec/resources/pedalcartoons3.png")
    documento.adicionar_imagem(imagem, "pedalcartoons3.png")
    imagem2 = File.read("#{Rails.root}/spec/resources/bosscartoons.png")
    documento.adicionar_imagem(imagem2, "bosscartoons.png")
    documento.salvar!
    odt = ZipFile.open(documento.arquivo)
    !odt.read("Pictures/pedalcartoons3.png").empty?
    !odt.read("Pictures/bosscartoons.png").empty?
    File.delete(documento.arquivo)
  end  

  it 'adiciona uma tabela ao documento' do
    documento = DocumentoOdt.new('tabela')
    tabela = "#{Rails.root}/spec/resources/tabela.odt"
    documento.adicionar_tabela(tabela)
    documento.salvar!
    File.delete(documento.arquivo)
  end

  it 'adiciona mais uma tabela ao documento' do
    documento = DocumentoOdt.new('duas_tabelas')
    tabela = "#{Rails.root}/spec/resources/tabela.odt"
    documento.adicionar_tabela(tabela)
    tabela2 = "#{Rails.root}/spec/resources/tabela.odt"
    documento.adicionar_tabela(tabela2)
    documento.salvar!
    File.delete(documento.arquivo)
  end

  it 'adiciona um texto ao documento' do 
    documento = DocumentoOdt.new('algum_texto')
    algum_texto = "algum texto qualquer"
    documento.adicionar_texto algum_texto
    documento.salvar!
    
    odt = Zip::ZipFile.open(documento.arquivo)
    doc = Document.new(odt.read("content.xml"))
    arquivo_odt = doc.to_s
    arquivo_odt.should match algum_texto
    File.delete(documento.arquivo)
  end
end