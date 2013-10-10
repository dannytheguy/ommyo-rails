class AddHiddenToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :hidden, :boolean, default: false
    add_index :brands, :hidden
  end
end
