# encoding: utf-8

FactoryGirl.define do
  factory :pedal do
    largura 60
    comprimento 125
    tensao 9
    corrente 20
  end
  factory :mala do
    largura 630
    comprimento 320
  end
  factory :fonte do
    corrente 1000
    largura 60
    comprimento 100
  end
  factory :saida_fonte do
    tensao 9
    centro_negativo true
  end
  

  factory :proprietario do
    nome "Alisson Zakka"
    contato "zakka_guitarista@gmail.com"
  end
    factory :local do
    nome "Manifesto"
    endereco "R. Iguatemi, 36C - Itaim Bibi"
    cidade "São Paulo"
    tipo "Bar"
  end
end
