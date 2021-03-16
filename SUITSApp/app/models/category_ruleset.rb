class CategoryRuleset < ApplicationRecord
  belongs_to :member_category
  belongs_to :event_type
end
