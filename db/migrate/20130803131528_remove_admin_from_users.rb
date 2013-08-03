require_relative '20130802164859_add_admin_to_users'

class RemoveAdminFromUsers < ActiveRecord::Migration
  def change
    revert AddAdminToUsers
  end
end
