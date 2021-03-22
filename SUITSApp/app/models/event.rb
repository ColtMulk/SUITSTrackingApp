class Event < ApplicationRecord
  has_many :attendances, dependent: :delete_all, foreign_key: "events_id"
  validates_presence_of :event_name, :location, :date, :event_description, :passcode_hash, :passcode_salt
  #belongs_to :event_types

  attr_accessor :passcode

  def encrypt_passcode
    self.passcode_salt = BCrypt::Engine.generate_salt
    self.passcode_hash = BCrypt::Engine.hash_secret(passcode, passcode_salt)
  end

end
