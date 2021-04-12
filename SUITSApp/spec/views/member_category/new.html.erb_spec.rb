# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'member_categories/new.html.erb', type: :view do
  before do
    assign(:member_category, MemberCategory.new)
  end

  it 'renders new member_category form' do
    render

    assert_select 'form[action=?][method=?]', member_categories_path, 'post' do
    end
  end
end
