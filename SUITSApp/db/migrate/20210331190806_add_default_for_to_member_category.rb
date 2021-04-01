class AddDefaultForToMemberCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :member_categories, :default_for, :integer, :default => 0
  end
end
