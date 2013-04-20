class CreateOrdemmusicas < ActiveRecord::Migration
  def change
    create_table :ordemmusicas do |t|
      t.integer :ordem
      t.integer :repertorio_id
      t.integer :musica_id

      t.timestamps
    end
  end
end
