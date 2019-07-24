class Lesson < ApplicationRecord
  has_many :userbookings
  has_many :reviews
  belongs_to :teacher, :class_name => “User”
end
