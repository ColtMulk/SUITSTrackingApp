class MoveRoleFromUserToUserInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :user_infos, :role, :integer
    remove_column :users, :role
  end
end
