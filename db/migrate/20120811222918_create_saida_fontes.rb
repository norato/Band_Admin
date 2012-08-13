class CreateSaidaFontes < ActiveRecord::Migration
  def change
    create_table :saida_fontes do |t|
      t.integer :tensao , :default => 9
      t.boolean :centro_negativo, :default => true
      t.references :pedal
      t.references :fonte

      t.timestamps
    end
  end
end
