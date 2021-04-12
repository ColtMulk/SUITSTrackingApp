# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'member_categories/edit.html.erb', type: :view do
  before do
    @member_category = assign(:member_category, MemberCategory.create!(name: 'test_member_category', default_for: 0))
  end

  it 'renders the edit member_category form' do
    render
  
    assert_select 'form[action=?][method=?]', member_category_path(@member_category), 'post' do
    end
  end
end