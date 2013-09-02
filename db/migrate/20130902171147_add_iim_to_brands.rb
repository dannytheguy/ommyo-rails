class AddIimToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :iim, :text
  end
end
