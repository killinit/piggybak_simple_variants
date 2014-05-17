class UpdatePiggybakSellables < ActiveRecord::Migration
  def up
  	add_column :piggybak_sellables, :variant_id, :integer
  end

  def down
  	remove_column :piggybak_sellables, :variant_id
  end
end
