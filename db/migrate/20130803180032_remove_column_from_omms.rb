class RemoveColumnFromOmms < ActiveRecord::Migration
  def change
    remove_column :omms, :updated_at, :datetime
  end
end
