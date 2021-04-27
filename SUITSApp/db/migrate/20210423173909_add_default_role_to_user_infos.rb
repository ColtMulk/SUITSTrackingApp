class AddDefaultRoleToUserInfos < ActiveRecord::Migration[6.1]
  def change
    change_column :user_infos, :role, :integer, :default => 2
  end
end
