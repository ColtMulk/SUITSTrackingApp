class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :events
      t.belongs_to :users
      # t.string :events_passcode_hash
      
      t.timestamps
    end
  end
end
