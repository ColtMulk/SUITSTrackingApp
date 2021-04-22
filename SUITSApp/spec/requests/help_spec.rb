# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Helps', type: :request do
  before do
    user = User.create(id: 1, password: 'password', password_confirmation: 'password', email: 'master@master.com', user_info: UserInfo.create(first_name: "master", last_name: "master", member_status: :new, role: :master))
    sign_in user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/help'
      expect(response).to have_http_status(:success)
    end
  end
end
