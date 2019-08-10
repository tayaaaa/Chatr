class MessagePolicy < ApplicationPolicy
    attr_reader :message, :user

    def initialize(user, message)
        @user = user
        @message = message
    end

    def create?
        @user
    end
    
end