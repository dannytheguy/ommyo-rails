class AddTermsToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :terms, :text, default: ''
  end
end
