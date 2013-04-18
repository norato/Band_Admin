class CreateProprietarios < ActiveRecord::Migration
  def change
    create_table :proprietarios do |t|
      t.string :nome
      t.string :contato

      t.timestamps
    end
  end
end
