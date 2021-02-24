class Attendance < ApplicationRecord
  belongs_to :events, foreign_key: true, foreign_key: "events_id", class_name: "Event"
  belongs_to :user, foreign_key: true, foreign_key: "users_id"
end
