class Message < ApplicationRecord
    belongs_to :conversation
    belongs_to :author, :class_name => "User"
end
