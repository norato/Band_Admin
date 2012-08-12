class CriarListaDeSaidasDeUmaFonte < ActiveRecord::Migration
  def up
    create_table :fontes_saida_fontes do |t|
      t.references :fonte, :saida_fonte
    end
  end

  def down
    drop_table :fontes_saida_fontes
  end
end
