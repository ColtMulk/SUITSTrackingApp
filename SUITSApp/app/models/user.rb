class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :user_info, inverse_of: :user, dependent: :destroy, autosave: true

  accepts_nested_attributes_for :user_info

  enum role: [ :master, :admin, :gen_member ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def user_info
  #   super || build_user_info
  # end
end
