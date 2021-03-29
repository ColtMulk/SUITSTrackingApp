# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  login_admin

  it 'has a current user' do
    expect(subject.current_user).not_to eq(nil)
  end
end
