# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Admin', type: :feature do

  def sign_in
    visit "users/sign_in"
    fill_in "Email", with: 'master@master.com'
    fill_in "Password", with: 'password'
    click_on "Log in"
  end

  scenario 'shows admin' do
    sign_in
    admin = User.create(password: 'password', password_confirmation: 'password', email: 'admin@admin.com', user_info: UserInfo.create(first_name: "Test", last_name: "Admin123", member_status: :new, role: :admin))

    visit "admins"

    expect(page).to have_text("Admin123")
  end

  scenario 'removes admin' do
    sign_in
    admin = User.create(password: 'password', password_confirmation: 'password', email: 'admin@admin.com', user_info: UserInfo.create(first_name: "Test", last_name: "Admin123", member_status: :new, role: :admin))
    visit "admins"

    expect(page).to have_text("Admin123")
    
    click_on "Remove Admin"

    expect(page).to_not have_text("Admin123")
  end
end