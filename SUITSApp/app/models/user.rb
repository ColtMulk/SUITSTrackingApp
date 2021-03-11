class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  enum role: { master: 0, admin: 1, gen_member: 2 }
  has_one :user_info, inverse_of: :user, dependent: :destroy, autosave: true

  accepts_nested_attributes_for :user_info
  has_many :attendances, dependent: :delete_all, foreign_key: 'users_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
