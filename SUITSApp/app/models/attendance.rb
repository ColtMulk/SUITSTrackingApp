# frozen_string_literal: true

class Attendance < ApplicationRecord
  belongs_to :events, foreign_key: true, class_name: 'Event', inverse_of: :attendances, optional: true
  belongs_to :user, foreign_key: true, inverse_of: :attendances, optional: true # , foreign_key: 'users_id'
  has_one :user_info, through: :user

  attr_accessor :user_passcode, :events_passcode_hash

  validates :events_id, :events_passcode_hash, :users_id, :user_passcode, presence: true

  def authenticate(user_passcode, events_passcode_hash)
    #  p 'authenticating'
    #  p user_passcode
    #  p events_passcode_hash
    BCrypt::Password.new(events_passcode_hash) == user_passcode
  end
end
