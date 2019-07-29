class Lesson < ApplicationRecord
  belongs_to :languageskill
  has_many :userbookings
  belongs_to :user
end
