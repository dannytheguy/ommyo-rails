class AddDisabledToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :disabled, :boolean, default: false
    add_index :brands, :disabled
  end
end
