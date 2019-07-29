class Lesson < ApplicationRecord
  belongs_to :languageskill
  has_many :userbookings
  belongs_to :teacher, :class_name => :user, :foreign_key => :user_id, optional: true
end
