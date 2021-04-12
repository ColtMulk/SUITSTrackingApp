# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'event_types/show', type: :view do
  before do
    @event_type = assign(:event_type, EventType.create(name: 'test_event_type'))
  end

  it 'renders attributes in <p>' do
    render
  end
end
