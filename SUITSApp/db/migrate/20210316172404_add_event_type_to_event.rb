class AddEventTypeToEvent < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :event_type, null: false, foreign_key: true
  end
end
