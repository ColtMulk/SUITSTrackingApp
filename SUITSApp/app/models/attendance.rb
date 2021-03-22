class Attendance < ApplicationRecord
  belongs_to :events, foreign_key: true, class_name: 'Event', optional: true
  belongs_to :user, foreign_key: true, foreign_key: 'users_id'
  has_one :user_info, through: :user

  attr_accessor :user_passcode
  attr_accessor :events_passcode_hash

  def authenticate(user_passcode, events_passcode_hash)
    BCrypt::Password.new(events_passcode_hash) == user_passcode
  end
end
