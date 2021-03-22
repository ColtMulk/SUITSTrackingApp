class Attendance < ApplicationRecord
  belongs_to :events, foreign_key: true, foreign_key: "events_id", class_name: "Event"
  belongs_to :user, foreign_key: true, foreign_key: "users_id"
  has_one :user_info, :through => :user
  validates_presence_of :events_id, :events_passcode, :users_id, :password_confirmation
end
