# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe MemberCategoriesController, type: :controller do

#   before do 
#     user = User.create(id: 1, password: 'password', password_confirmation: 'password', email: 'master@master.com', user_info: UserInfo.create(first_name: "master", last_name: "master", member_status: :new, role: :master))
#     sign_in user
#     # @new_default ||= MemberCategory.create!(name: "test2", default_for: 1)
#     # @old_default ||= MemberCategory.create!(name: "test1", default_for: 2)
#     post :create, params: {member_category: {name: "test1", default_for: 1, category}}
#     post :create, params: {member_category: {name: "test2", default_for: 2}}
#   end

#   it 'only lets one category be default for new users' do
#     post :create, params: {member_category: {name: "test", default_for: 1}}

#     p response

#     expect(MemberCategory.where(default_for: :new).length).to eq(1)
#   end

#   it 'only lets one category be default for old users' do
#     post :create, params: {member_category: {name: "test", default_for: 2}}

#     expect(MemberCategory.where(default_for: :old).length).to eq(1)
#   end
# end
