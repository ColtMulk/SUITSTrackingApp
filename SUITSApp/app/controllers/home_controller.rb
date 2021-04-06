# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    redirect_to dashboard_index_path if current_user
  end
end
