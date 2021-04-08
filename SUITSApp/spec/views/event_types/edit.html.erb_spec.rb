# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'event_types/edit', type: :view do
  before do
    @event_type = assign(:event_type, EventType.create!)
  end

  it 'renders the edit event_type form' do
    render

    assert_select 'form[action=?][method=?]', event_type_path(@event_type), 'post' do
    end
  end
end
