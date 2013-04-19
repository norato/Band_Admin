class CreateMusicas < ActiveRecord::Migration
  def change
    create_table :musicas do |t|
      t.string :nome
      t.integer :duracao
      t.integer :bpm
      t.string :estilo

      t.timestamps
    end
  end
end
