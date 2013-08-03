class AddOmmToBrand < ActiveRecord::Migration
  def change
    change_table :omms do |t|
      t.references :brand, index: true 
    end
  end
  def down
    change_table :omms do |t|
      t.remove :brand
    end
  end
end
