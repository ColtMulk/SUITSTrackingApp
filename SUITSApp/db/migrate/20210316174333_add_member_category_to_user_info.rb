class AddMemberCategoryToUserInfo < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_infos, :member_category, null: true, foreign_key: true
  end
end
