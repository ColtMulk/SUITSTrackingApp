# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'event_types/new', type: :view do
  before do
    assign(:event_type, EventType.new)
  end

  it 'renders new event_type form' do
    render

    assert_select 'form[action=?][method=?]', event_types_path, 'post' do
    end
  end
end
