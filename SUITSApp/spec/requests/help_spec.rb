# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Helps', type: :request do
  before(:each) do
    user = User.create(id: 1, role: :master, password:'password', password_confirmation:'password', email:'master@master.com')
    sign_in user
  end
  
  describe 'GET /index' do
    it 'returns http success' do
      get '/help'
      expect(response).to have_http_status(:success)
    end
  end
end
