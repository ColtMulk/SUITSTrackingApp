class Event < ApplicationRecord

  has_many :attendances, dependent: :delete_all, foreign_key: "events_id"
  validates_presence_of :event_name, :date, :event_descripition
  belongs_to :event_type

end
