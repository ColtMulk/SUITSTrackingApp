class MemberCategory < ApplicationRecord
  has_many :category_rulesets, dependent: :destroy
  has_many :event_types, through: :category_rulesets

  accepts_nested_attributes_for :category_rulesets, allow_destroy: true
end
