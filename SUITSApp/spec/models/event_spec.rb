require 'rails_helper'
RSpec.describe Event, :type => :model do
  subject {
    described_class.new(event_name: 'TestEvent', location: 'TAMU', date: '03/10/2021', event_description: 'this is a test event', passcode: '1234')
  }
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a name' do
      subject.event_name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a location' do
      subject.location = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a date' do
      subject.date = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a description' do
      subject.event_description = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a passcode' do
      subject.passcode = nil
      expect(subject).to_not be_valid
    end
  end
end
