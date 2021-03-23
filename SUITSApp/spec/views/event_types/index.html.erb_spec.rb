require 'rails_helper'

RSpec.describe "event_types/index", type: :view do
  before(:each) do
    assign(:event_types, [
      EventType.create!(),
      EventType.create!()
    ])
  end

  it "renders a list of event_types" do
    render
  end
end
