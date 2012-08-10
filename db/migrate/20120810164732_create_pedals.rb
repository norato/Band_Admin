class CreatePedals < ActiveRecord::Migration
  def up
    create_table :pedals do |t|
      t.string :nome
      t.integer :largura
      t.integer :comprimento
      t.integer :tensao
      t.integer :corrente
      t.string :tipo

      t.timestamps
    end
  end
  def down
    drop_table :pedals
  end
end
