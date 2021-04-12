# frozen_string_literal: true

class MemberCategory < ApplicationRecord
  has_many :category_rulesets, dependent: :destroy
  has_many :event_types, through: :category_rulesets

  accepts_nested_attributes_for :category_rulesets, allow_destroy: true

  enum default_for: { none: 0, new: 1, old: 2 }, _suffix: :default
  validates :name, presence: true
end
