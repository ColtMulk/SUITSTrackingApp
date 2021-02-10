class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  enum role: [ :master, :admin, :gen_member ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
