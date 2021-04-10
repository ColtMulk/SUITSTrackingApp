# frozen_string_literal: true

class DashboardController < ApplicationController
  require 'date'

  def index
    @events = Event.where("date >= ?", Date.today).where("date <= ?", Date.today + 7.day).order(:date).limit(5)
  end

  def rosterview; end
end
