class AdicionarChaveEstrangeiraDeRepertorioEmEventos < ActiveRecord::Migration
  def up
  	change_table :eventos do |t|
      t.integer :repertorio_id
    end  	 
  end

  def down
    change_table :eventos do |t|
      t.remove :repertorio_id
    end
  end
end