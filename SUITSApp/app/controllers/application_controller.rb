# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    dashboard_index_path
  end

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [ user_info_attributes: [:first_name, :last_name]])
  # end
end
