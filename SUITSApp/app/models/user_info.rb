class UserInfo < ApplicationRecord
  belongs_to :user, inverse_of: :user_info
  belongs_to :member_category, optional: true

  enum member_status: { new: 0, old: 1, alumni: 2 }, _prefix: :status

  validates :first_name, :last_name, :member_status, presence: true

  after_initialize :init

  def init 
    return if !new_record?
    if self.status_new?
      self.member_category = MemberCategory.where(default_for: :new)[0]
    elsif self.status_old?
      self.member_category = MemberCategory.where(default_for: :old)[0]
    end
  end

end
