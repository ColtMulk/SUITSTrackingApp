class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_description
      t.timestamp :date
      t.string :location
      t.string :passcode_hash
      t.boolean :is_open

      t.timestamps
    end
  end
end
