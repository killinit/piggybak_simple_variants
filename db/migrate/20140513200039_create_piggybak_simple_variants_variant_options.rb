class CreatePiggybakSimpleVariantsVariantOptions < ActiveRecord::Migration
  def up
    create_table :piggybak_simple_variants_variant_options do |t|
      t.integer :variant_id, null: false
      t.integer :option_value_id, null: false
      t.timestamps
    end
    add_index :piggybak_simple_variants_variant_options, :variant_id, :name => 'piggybak_sv_variant_options_option_value_id'
    add_index :piggybak_simple_variants_variant_options, :option_value_id, :name => 'piggybak_sv_variant_options_option_value_id'
  end

  def down
  	drop_table :piggybak_simple_variants_variant_options
  end
end
