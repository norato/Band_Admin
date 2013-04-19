class CreateOrganizadors < ActiveRecord::Migration
  def change
    create_table :organizadors do |t|
      t.string :nome
      t.string :contato

      t.timestamps
    end
  end
end
