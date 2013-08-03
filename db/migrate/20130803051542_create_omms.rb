class CreateOmms < ActiveRecord::Migration
  def change
    create_table :omms do |t|
      t.string :body

      t.timestamps
    end
  end
end
