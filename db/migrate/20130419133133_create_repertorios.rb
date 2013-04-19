class CreateRepertorios < ActiveRecord::Migration
  def change
    create_table :repertorios do |t|
      t.string :nome

      t.timestamps
    end
  end
end
