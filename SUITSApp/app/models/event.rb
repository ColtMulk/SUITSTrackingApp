class Event < ApplicationRecord
  has_many :attendances, dependent: :delete_all, foreign_key: 'events_id'

  # belongs_to :event_types
end
