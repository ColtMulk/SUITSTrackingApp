# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Event, type: :model do
  subject(:test_event) do
    described_class.new(id: 1, event_name: 'TestEvent', location: 'TAMU', date: '03/10/2021',
                        event_description: 'this is a test event', passcode: '1234', event_type_id: 1,
                        passcode_hash: 'ABC', passcode_salt: 'XYZ')
  end

  #test_event = FactoryBot.build(:event)
  describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(test_event).to be_valid
    end

    it 'is not valid without a name' do
      test_event.event_name = nil
      expect(test_event).not_to be_valid
    end

    it 'is not valid without a location' do
      test_event.location = nil
      expect(test_event).not_to be_valid
    end

    it 'is not valid without a date' do
      test_event.date = nil
      expect(test_event).not_to be_valid
    end

    it 'is not valid without a description' do
      test_event.event_description = nil
      expect(test_event).not_to be_valid
    end

    it 'is not valid without a passcode' do
      test_event.passcode_hash = nil
      expect(test_event).not_to be_valid
    end
  end
end
