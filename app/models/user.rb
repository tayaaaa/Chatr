class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :conversations
	belongs_to :role, optional: true
	has_many :notifications
  has_one :profile
  has_many :userbookings
  has_many :messages
  has_many :lessons
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  #validating that the email is unique.
  
end
