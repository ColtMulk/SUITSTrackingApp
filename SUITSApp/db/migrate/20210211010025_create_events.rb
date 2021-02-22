class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_descripition
      t.timestamp :date
      t.string :location
      t.string :passcode

      t.timestamps
    end
  end
end
