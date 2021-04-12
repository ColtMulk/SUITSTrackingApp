# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'member_categories/index.html.erb', type: :view do
  before do
    assign(:member_categories, [
             MemberCategory.create(name: 'test_member_category0', default_for: 0),
             MemberCategory.create(name: 'test_member_category1', default_for: 0)
           ])
  end

  it 'renders a list of member_categories' do
    render
  end
end
