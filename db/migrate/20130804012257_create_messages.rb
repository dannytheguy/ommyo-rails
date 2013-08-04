class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :omm_id
      t.integer :author_id
      t.string :author_type

      t.datetime :created_at
    end

    remove_column :omms, :body, :string
  end
end
