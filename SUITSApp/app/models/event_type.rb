class EventType < ApplicationRecord
  has_many :events

  has_many :category_rulesets
  has_many :member_category, through: :category_rulesets
end
