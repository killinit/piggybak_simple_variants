class CreatePiggybakSimpleVariantsVariants < ActiveRecord::Migration
  def change
    create_table :piggybak_simple_variants_variants do |t|
      t.string :name, null: false
      t.string :klass, null: false
      t.timestamps
    end
  end
end
