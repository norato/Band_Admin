class CreateOrdemmusicas < ActiveRecord::Migration
  def change
    create_table :ordemmusicas do |t|
      t.integer :ordem
      t.integer :repertorio_id
      t.integer :musica_id

      t.timestamps
    end
    add_index :ordemmusicas, :repertorio_id
    add_index :ordemmusicas, :musica_id
  end
end
