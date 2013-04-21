class AdicionarChaveEstrangeiraDeOrganizadorEmEventos < ActiveRecord::Migration
  def up
    change_table :eventos do |t|
      t.integer :organizador_id
    end
  end

  def down
    change_table :eventos do |t|
      t.remove :organizador_id
    end
  end
end
