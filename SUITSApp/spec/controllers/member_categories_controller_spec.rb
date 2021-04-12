# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MemberCategoriesController, type: :controller do

  before do 
    user = User.create(id: 1, role: :master, password: 'password', password_confirmation: 'password', email: 'master@master.com')
    sign_in user
    # @new_default ||= MemberCategory.create!(name: "test2", default_for: 1)
    # @old_default ||= MemberCategory.create!(name: "test1", default_for: 2)
    post :create, params: {name: "test1", default_for: :new, category_rulesets_attributes: {}}
    post :create, params: {name: "test2", default_for: :old, category_rulesets_attributes: {}}
  end

  it 'only lets one category be default for new users' do
    post :create, params: {name: "test", default_for: :new, category_rulesets_attributes: {}}

    p response

    expect(MemberCategory.where(default_for: :new).length).to eq(1)
  end

  it 'only lets one category be default for old users' do
    post :create, params: {name: "test", default_for: :old, category_rulesets_attributes: {}}

    expect(MemberCategory.where(default_for: :old).length).to eq(1)
  end
end
