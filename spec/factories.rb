FactoryGirl.define do
  factory :pedal do
    nome 'DS-1'
    largura 60
    comprimento 125
    tipo 'drive'
    tensao 9
    corrente 200
  end
  factory :mala do
    nome "Pedal Train"
    largura 630
    comprimento 320
  end
end