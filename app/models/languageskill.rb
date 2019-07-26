class Languageskill < ApplicationRecord
    belongs_to :profile, optional: true
    validates :proficiency, :inclusion => { :in => 0..10 }
end
