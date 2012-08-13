class CreatePedais < ActiveRecord::Migration
  def up
    create_table :pedais do |t|
      t.string :nome
      t.integer :largura
      t.integer :comprimento
      t.integer :tensao
      t.integer :corrente
      t.string :tipo

      t.references :mala

      t.timestamps
    end
  end
  def down
    drop_table :pedais
  end
end
