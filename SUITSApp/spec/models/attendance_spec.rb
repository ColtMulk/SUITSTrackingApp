# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  describe 'Validation' do
    subject(:test_attendance) do
      user = User.create(id: 1, role: :master, password: 'password', password_confirmation: 'password', email: 'master@master.com')
      event = Event.create(event_name: 'TestEvent', location: 'TAMU', date: '03/10/2021',
                           event_description: 'this is a test event', passcode: '1234', event_type_id: 1,
                           passcode_hash: 'ABC', passcode_salt: 'XYZ')
      described_class.new(events_id: event.id, events_passcode_hash: event.passcode_hash, users_id: user.id, user_passcode: user.password)
    end

    it 'is valid with valid attributes' do
      expect(test_attendance).to be_valid
    end

    it 'is not valid without events_id' do
      test_attendance.events_id = nil
      expect(test_attendance).not_to be_valid
    end

    it 'is not valid without events_passcode_hash' do
      test_attendance.events_passcode_hash = nil
      expect(test_attendance).not_to be_valid
    end

    it 'is not valid without users_id' do
      test_attendance.users_id = nil
      expect(test_attendance).not_to be_valid
    end

    it 'is not valid without user_passcode' do
      test_attendance.user_passcode = nil
      expect(test_attendance).not_to be_valid
    end
  end
end
