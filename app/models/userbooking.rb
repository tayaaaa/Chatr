class Userbooking < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_one :review
end
