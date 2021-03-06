# frozen_string_literal: true

class CategoryRuleset < ApplicationRecord
  belongs_to :member_category, optional: true
  belongs_to :event_type
end
