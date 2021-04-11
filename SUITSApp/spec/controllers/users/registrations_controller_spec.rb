# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  it 'has a current user' do
    user = User.create(id: 1, role: :master, password:'password', password_confirmation:'password', email:'master@master.com')
    sign_in user
    expect(user).not_to eq(nil)
  end
end
