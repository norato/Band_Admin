require 'fileutils'
require 'nokogiri'
require 'rubygems'
require 'rexml/document'
include REXML
include Zip

class DocumentoOdt
  def initialize(nome)
    template_modelo = "#{Rails.root}/public/template.odt"
    @arquivo = File.join("#{Rails.root}/tmp/#{nome}.odt")
    FileUtils.cp(template_modelo, @arquivo)
    @arquivo_odt = Zip::ZipFile.open(@arquivo)
    @content = Document.new(@arquivo_odt.read("content.xml"))
    root = @content.root
    body = root.elements[4]
    @tag_estilo = root.elements[3]
    @tag_texto = body.elements[1]
  end

  def arquivo
    @arquivo
  end

  def adicionar_imagem(imagem, nome)
    imagem_temporaria = Tempfile.new("#{Rails.root}/tmp/#{nome}", "w")
    imagem_temporaria.write(imagem.force_encoding('UTF-8'))
    imagem_odt = "Pictures/" + nome
    @arquivo_odt.add(imagem_odt, imagem_temporaria)
    size = IO.read(imagem_temporaria)[0x10..0x18].unpack('NN')
    px_to_cm = 0.012
    width, height  = size.map{|i| i * px_to_cm}.map{|x| x.to_s + "cm"}
    element = Element.new("text:p", parent = @tag_texto)
    element.add_attribute "text:style-name","Standard"
    frame = Element.new("draw:frame",parent=element)
    frame.add_attribute("text:anchor-type", "as-char")
    frame.add_attribute("svg:width", width)
    frame.add_attribute("svg:height", height)
    Element.new("draw:image xlink:actuate='onLoad'
                 xlink:href='#{imagem_odt}'
                 xlink:show='embed'
                 xlink:type='simple'", parent=frame)
    imagem_temporaria.close()
  end

  def adicionar_tabela(grao)
    table = ZipFile.open(grao)
    table_parsed = Nokogiri::XML(table.read("content.xml"))
    estilo = table_parsed.xpath("//style:style")
    extrair_estilo(estilo, @tag_estilo)
    tabela = table_parsed.xpath('//table:table').first
    extrair_tabela(tabela, @tag_texto)
  end

  def adicionar_texto(texto)
    Element.new("text:p", @tag_texto).add_text(texto)
  end

  def cria_tabela
    style_table_properties = Element.new("style:style", @tag_estilo)
    style_table_properties.add_attribute("style:family","table")
    style_table_properties.add_attribute("style:name","Tabela1")

    tag_tabela_properties = Element.new("style:table-properties", style_table_properties)
    tag_tabela_properties.add_attribute("table:align","margins")
    tag_tabela_properties.add_attribute("style:width","17cm")

    style_column_properties = Element.new("style:style", @tag_estilo)
    style_column_properties.add_attribute("style:name","Tabela1.A")
    style_column_properties.add_attribute("style:family","table-column")
    tag_column_properties = Element.new("style:table-column-properties", style_column_properties)
    tag_column_properties.add_attribute("style:column-width","17cm")
    tag_column_properties.add_attribute("style:rel-column-width","65535*")

    style_cell_properties = Element.new("style:style", @tag_estilo)
    style_cell_properties.add_attribute("style:name","Tabela1.A1")
    style_cell_properties.add_attribute("style:family","table-cell")
    tag_cell_properties = Element.new("style:table-cell-properties",style_cell_properties)
    tag_cell_properties.add_attribute("fo:border","0.002cm solid #000000")
    tag_cell_properties.add_attribute("fo:padding","0.097cm")


    tag_tabela = Element.new("table:table", @tag_texto)
    tag_tabela.add_attribute("table:name","Tabela1")
    tag_tabela.add_attribute("table:style-name","Tabela1")

    tag_column = Element.new("table:table-column", tag_tabela)
    tag_column.add_attribute("table:style-name","Tabela1.A")

    tag_row = Element.new("table:table-row", tag_column)

    tag_table_cell = Element.new("table:table-cell", tag_row)
    tag_table_cell.add_attribute("table:style-name","Tabela1.A1")
    tag_table_cell.add_attribute("office:value-type","string")

    Element.new("text:p", tag_table_cell) 
  end

  def salvar!
    myfile = Tempfile.new("#{Rails.root}/tmp/myfile.xml", "w")
    @content.write(myfile)
    @arquivo_odt.replace("content.xml", myfile)
    myfile.close
    @arquivo_odt.close
  end

  private

  def novo_elemento(elemento, pai)
    novo = Element.new("#{elemento.namespace.prefix}:#{elemento.node_name}", pai)
    elemento.attribute_nodes.each do |node|
      novo.add_attribute("#{node.namespace.prefix}:#{node.name}", node.value)
    end
    novo
  end

  def extrair_estilo(estilo, elemento_pai)
    estilo.each do |estilo|
      style = novo_elemento estilo , elemento_pai
      tag = novo_elemento estilo.child, style
    end
  end

  def extrair_tabela(tabela, elemento_pai)
    novo = novo_elemento(tabela , elemento_pai)
    tabela.children.each do |filho|
      if filho.namespace.prefix == 'text'
        texto = novo_elemento(filho, novo)
        texto.add_text(filho.text)
      else
        extrair_tabela(filho, novo)
      end
    end
  end
end
