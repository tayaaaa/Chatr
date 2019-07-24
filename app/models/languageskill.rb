class Languageskill < ApplicationRecord
    belongs_to :profile
    validates :proficiency, :inclusion => { :in => 0..10 }
end
