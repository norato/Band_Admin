# encoding: utf-8

class Fonte < ActiveRecord::Base
  attr_accessible :corrente, :nome , :comprimento, :largura, :saidas
  has_many :saidas, class_name: 'SaidaFonte'
  belongs_to :mala
  

  def dimensoes
    [largura , comprimento]
  end

  def largura_util
  	largura + 10
  end

  def comprimento_util
  	comprimento + 20
  end

  def area
  	largura_util * comprimento_util
  end

  def adicionar_saida(saida)
    if saidas.count >= 5
      unless @especificacoes
        raise "Definir Especificações da fonte"
      else
        if saidas_usadas[saida.tensao] < @especificacoes[saida.tensao]
          saidas << saida
        else
          raise "Não disponível saídas de #{saida.tensao}v"
        end
      end
    else
      saidas << saida
    end
  end

  def corrente_disponivel
    corrente - corrente_total
  end

  def corrente_total
    if saidas.empty?
      0
    else
      saidas.map(&:corrente_pedal).reduce(:+)
    end
  end

  def pedais
    saidas.map(&:pedal)
  end

  def saidas_usadas
    lista =  {}
    if saidas.empty?
      lista
    else
      saidas.map(&:tensao).uniq.each do |s|
        lista[s] = saidas.map(&:tensao).count(s)
      end
    end
    lista
  end

  def especificacoes=(definicao)
    @especificacoes = definicao
  end

  def especificacoes
    @especificacoes
  end

  def especificacoes_humanizado
    if @especificacoes
      humanizar @especificacoes
    else
      humanizar saidas_usadas
    end
  end

  def humanizar(hash)
    string = ""
    lista = []
    hash.each do |chave, valor|
      lista << ("#{valor} saida#{valor > 1 ? 's' : ''} de #{chave}v")
    end
    lista.to_sentence.gsub(/\,? and /, ' e ')
  end

end