# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:test_user) do
    user_info = UserInfo.create(id: 1, first_name: 'fname', last_name: 'lname', member_status: 'new', member_category_id: 1)
    described_class.new(id: 1, email: 'test@email.com', password: 'password',
                        password_confirmation: 'password', user_infos_id: user_info.id)
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(test_user).to be_valid
    end

    it 'is not valid without an email' do
      test_user.email = nil
      expect(test_user).not_to be_valid
    end

    it 'is not valid without a password' do
      test_user.password = nil
      expect(test_user).not_to be_valid
    end
  end
end
