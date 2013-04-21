class AdicionarChaveEstrangeiraDeLocalEmEventos < ActiveRecord::Migration
  def up
    change_table :eventos do |t|
      t.integer :local_id
    end
  end

  def down
    change_table :eventos do |t|
      t.remove :local_id
    end
  end
end
