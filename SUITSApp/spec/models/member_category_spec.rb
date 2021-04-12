# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MemberCategory, type: :model do
  subject(:test_member_category) do
    described_class.new(id: 1, name: 'test_member_category')
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(test_member_category).to be_valid
    end

    it 'is not valid without a name' do
      test_member_category.name = nil
      expect(test_member_category).not_to be_valid
    end
  end
end
