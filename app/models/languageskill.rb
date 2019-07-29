class Languageskill < ApplicationRecord
    belongs_to :profile, optional: true
    has_many :lessons
    validates :proficiency, :inclusion => { :in => 0..10 }
end
