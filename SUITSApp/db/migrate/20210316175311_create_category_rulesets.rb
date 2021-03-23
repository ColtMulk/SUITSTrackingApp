class CreateCategoryRulesets < ActiveRecord::Migration[6.1]
  def change
    create_table :category_rulesets do |t|
      t.integer :points
      t.references :member_category, null: false, foreign_key: true
      t.references :event_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
