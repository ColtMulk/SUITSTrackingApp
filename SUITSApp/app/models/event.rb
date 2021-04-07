# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendances, dependent: :delete_all, foreign_key: 'events_id', inverse_of: :events
  validates :event_name, :location, :date, :event_description, :passcode_hash,
            :passcode_salt, presence: true
  belongs_to :event_type, foreign_key: true, inverse_of: :events

  attr_accessor :passcode

  def encrypt_passcode
    self.passcode_salt = BCrypt::Engine.generate_salt
    self.passcode_hash = BCrypt::Password.create(passcode)
  end
end
