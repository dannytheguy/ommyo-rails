class AddEmailToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :email, :string
  end
end
