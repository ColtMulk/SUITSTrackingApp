# frozen_string_literal: true

json.extract! event_type, :id, :created_at, :updated_at
json.url event_type_url(event_type, format: :json)
