class AdicionarComprimentoELarguraParaAFonte < ActiveRecord::Migration
  def change
  	add_column :fontes , :comprimento, :integer
  	add_column :fontes , :largura , :integer
  end
end
