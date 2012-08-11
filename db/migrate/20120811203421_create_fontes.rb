class CreateFontes < ActiveRecord::Migration
  def change
    create_table :fontes do |t|
      t.string :nome
      t.integer :corrente

      t.timestamps
    end
  end
end
