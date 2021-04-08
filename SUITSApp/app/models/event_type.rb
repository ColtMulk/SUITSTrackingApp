# frozen_string_literal: true

class EventType < ApplicationRecord
  has_many :events, dependent: :destroy

  has_many :category_rulesets, dependent: :destroy
  has_many :member_category, through: :category_rulesets
end
