class CreatePiggybakSimpleVariantsOptionValues < ActiveRecord::Migration
  def change
    create_table :piggybak_simple_variants_option_values do |t|
      t.integer :option_id, null: false
      t.string :name, null: false
      t.integer :position
      t.timestamps
    end
  end
end
