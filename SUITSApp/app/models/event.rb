class Event < ApplicationRecord
  has_many :attendances, dependent: :delete_all, foreign_key: "events_id"
  validates_presence_of :event_name, :location, :date, :event_description, :passcode_hash, :passcode_salt
  belongs_to :event_type, foreign_key: true, foreign_key: 'event_type_id'

  attr_accessor :passcode

  def encrypt_passcode
    self.passcode_salt = BCrypt::Engine.generate_salt
    self.passcode_hash = BCrypt::Password.create(passcode)
  end

  scope :desc, -> {order(event_name: :desc)}
  scope :date, -> {order(date: :desc)}
  scope :open, -> {order(is_open: :desc)}
end
