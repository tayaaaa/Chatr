class Lesson < ApplicationRecord
  belongs_to :languageskill
  has_many :userbookings
  belongs_to :user

  scope :lessons_by_language, -> (language) { joins(:languageskill).where('language_name = ?', language) }

end
