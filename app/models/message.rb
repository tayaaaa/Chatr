class Message < ApplicationRecord
    belong_to :thread
	has_one :user
end
