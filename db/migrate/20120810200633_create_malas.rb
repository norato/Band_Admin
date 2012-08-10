class CreateMalas < ActiveRecord::Migration
  def change
    create_table :malas do |t|
      t.string :nome
      t.integer :largura
      t.integer :comprimento

      t.timestamps
    end
  end
end
