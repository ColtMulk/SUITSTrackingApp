# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one :user_info, inverse_of: :user, dependent: :destroy, autosave: true, required: false

  accepts_nested_attributes_for :user_info
  has_many :attendances, dependent: :delete_all, foreign_key: 'users_id', inverse_of: :user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, :password, :password_confirmation, presence: true
end
