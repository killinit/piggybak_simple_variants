class CreatePiggybakSimpleVariantsOptions < ActiveRecord::Migration
  def change
    create_table :piggybak_simple_variants_options do |t|
      t.string :name, null: false
      t.integer :position
      t.timestamps
    end
  end
end
