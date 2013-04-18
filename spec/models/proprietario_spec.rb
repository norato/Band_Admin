require 'spec_helper'

describe Proprietario do
  it 'possui como atributos nome e contato' do
  	proprietario = Proprietario.new(nome: "Alisson Zakka", contato: "zakka_guitarista@gmail.com")
  	proprietario.nome.should == "Alisson Zakka"
  	proprietario.contato.should == "zakka_guitarista@gmail.com"
  end
end
