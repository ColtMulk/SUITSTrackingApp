# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MemberCategories', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      user = User.create(id: 69, email: 'test@test.com', password: 'password', password_confirmation: 'password', role: 0) ## uncomment if not using FactoryBot
      sign_in user
      get '/member_category/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      user = User.create(id: 69, email: 'test@test.com', password: 'password', password_confirmation: 'password', role: 0) ## uncomment if not using FactoryBot
      sign_in user
      get '/member_category/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      user = User.create(id: 69, email: 'test@test.com', password: 'password', password_confirmation: 'password', role: 0) ## uncomment if not using FactoryBot
      sign_in user
      get '/member_category/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      user = User.create(id: 69, email: 'test@test.com', password: 'password', password_confirmation: 'password', role: 0) ## uncomment if not using FactoryBot
      sign_in user
      get '/member_category/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      user = User.create(id: 69, email: 'test@test.com', password: 'password', password_confirmation: 'password', role: 0) ## uncomment if not using FactoryBot
      sign_in user
      get '/member_category/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      user = User.create(id: 69, email: 'test@test.com', password: 'password', password_confirmation: 'password', role: 0) ## uncomment if not using FactoryBot
      sign_in user
      get '/member_category/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      user = User.create(id: 69, email: 'test@test.com', password: 'password', password_confirmation: 'password', role: 0) ## uncomment if not using FactoryBot
      sign_in user
      get '/member_category/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
