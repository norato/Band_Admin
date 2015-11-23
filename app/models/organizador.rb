class Organizador < ActiveRecord::Base
  # attr_accessible :contato, :nome
  has_many :eventos
end
