class ListaDePedaisParaMala < ActiveRecord::Migration
  def up
  	create_table :malas_pedals do |t|
      t.references :mala , :pedal
    end      
  end

  def down
    drop_table :malas_pedals
  end
end
