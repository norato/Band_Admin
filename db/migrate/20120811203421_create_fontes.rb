class CreateFontes < ActiveRecord::Migration
  def change
    create_table :fontes do |t|
      t.string :nome
      t.integer :corrente

      t.references :mala

      t.timestamps
    end
  end
end
