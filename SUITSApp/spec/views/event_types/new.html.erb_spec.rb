require 'rails_helper'

RSpec.describe "event_types/new", type: :view do
  before(:each) do
    assign(:event_type, EventType.new())
  end

  it "renders new event_type form" do
    render

    assert_select "form[action=?][method=?]", event_types_path, "post" do
    end
  end
end
