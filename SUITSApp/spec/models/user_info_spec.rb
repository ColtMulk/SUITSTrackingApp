require 'rails_helper'

RSpec.describe UserInfo, :type => :model do
  describe 'Validation' do
    testuser = FactoryBot.build(:user)

    it 'is valid with valid attributes' do
      expect(testuser).to be_valid
    end
    it 'is not valid without first name' do
      testuser.user_info.first_name = nil
      expect(testuser).to_not be_valid
    end
    it 'is not valid without last name' do
      testuser.user_info.last_name = nil
      expect(testuser).to_not be_valid
    end
    it 'is not valid without member status' do
      testuser.user_info.member_status = nil
      expect(testuser).to_not be_valid
    end
  end
end
