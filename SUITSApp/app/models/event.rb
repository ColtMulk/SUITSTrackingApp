# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendances, dependent: :delete_all, foreign_key: 'events_id', inverse_of: :events
  validates :event_name, :location, :date, :event_description, :passcode_hash,
            presence: true
  belongs_to :event_type, inverse_of: :events

  attr_accessor :passcode
  attr_accessor :new_passcode

end
