class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :events
      t.belongs_to :users
      t.timestamps
    end
  end
end
