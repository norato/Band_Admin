class AdicionarFonteAMala < ActiveRecord::Migration
  def up
  	create_table :fontes_malas do |t|
      t.references :mala , :fonte
    end      
  end

  def down
  	drop_table :malas_fontes
  end
end
