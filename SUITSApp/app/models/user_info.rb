class UserInfo < ApplicationRecord
  belongs_to :user, inverse_of: :user_info

  enum member_status: { new: 0, old: 1, alumni: 2 }, _prefix: :status

  validates :first_name, :last_name, :member_status, presence: true
end
