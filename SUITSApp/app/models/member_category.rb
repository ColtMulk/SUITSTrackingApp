class MemberCategory < ApplicationRecord
  has_many :category_rulesets
  has_many :event_types, through: :category_rulesets
end
