class CreateMemberCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :member_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
