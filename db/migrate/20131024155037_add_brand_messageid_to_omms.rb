class AddBrandMessageidToOmms < ActiveRecord::Migration
  def change
    add_column :omms, :brand_messageid, :string
  end
end
