class CreateUserInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_infos do |t|
      t.string :first_name
      t.string :last_name
      t.integer :member_status
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end

    add_reference :users, :user_infos, foreign_key: true
  end
end
