class AdicionarChaveEstrangeiraDeProprietarioEmLocais < ActiveRecord::Migration
  def up
  	change_table :locais do |t|
      t.integer :proprietario_id
    end  	 
  end

  def down
    change_table :locais do |t|
      t.remove :proprietario_id
    end
  end
end
