class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  enum role: [ :master, :admin, :gen_member ]
  has_many :attendances, dependent: :delete_all, foreign_key: "users_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_info
end
