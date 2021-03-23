class AddRolesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :integer

    # Initialize master account:
    #User.create! do |u|
    #  u.email = 'master@master.com'
    #  u.password = 'password'
    #  u.role = 0
    #end
  end
end
