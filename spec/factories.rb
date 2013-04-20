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
  factory :evento do
    nome "Festival de Bandas de Garagem"
    data "14/06/2013"
  end
  factory :organizador do
    nome "Dedé Muylaert"
    contato "dede_muylaert@foo.com"
  end
  factory :repertorio do
    nome "Death Metal"
  end
    factory :musica do
    nome "Cuervo"
    duracao 500
    bpm 120
    estilo "Spanish Rock"
  end
  factory :ordemmusica do
    ordem 1
  end
end
