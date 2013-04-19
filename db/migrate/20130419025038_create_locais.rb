class CreateLocais < ActiveRecord::Migration
  def change
    create_table :locais do |t|
      t.string :nome
      t.string :endereco
      t.string :cidade
      t.string :tipo

      t.timestamps
    end
  end
end
