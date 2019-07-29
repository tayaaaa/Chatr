class Review < ApplicationRecord
  belongs_to :userbooking
  has_one :reply
end
