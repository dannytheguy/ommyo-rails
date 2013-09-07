class AddUnreadToOmms < ActiveRecord::Migration
  def change
    add_column :omms, :unread, :boolean, default: false
  end
end
