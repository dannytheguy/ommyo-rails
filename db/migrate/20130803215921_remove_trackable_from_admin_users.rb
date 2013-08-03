class RemoveTrackableFromAdminUsers < ActiveRecord::Migration
  def change
    remove_column :admin_users, :sign_in_count, :integer
    remove_column :admin_users, :current_sign_in_at, :datetime
    remove_column :admin_users, :last_sign_in_at, :datetime
    remove_column :admin_users, :current_sign_in_ip, :string
    remove_column :admin_users, :last_sign_in_ip, :string
  end
end
