class AddBrandEmailToOmms < ActiveRecord::Migration
  def change
    add_column :omms, :brand_email, :string
  end
end
