class Userbooking < ApplicationRecord
  belongs_to :student, :class_name => :user, :foreign_key => :user_id, optional: true
  belongs_to :lesson
end
