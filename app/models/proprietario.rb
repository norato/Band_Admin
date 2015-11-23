class Proprietario < ActiveRecord::Base
  # attr_accessible :contato, :nome
  has_many :locais
end
