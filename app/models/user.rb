class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :conversations
	has_one :role
	has_many :notifications
	has_one :profile
	has_many :messages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
