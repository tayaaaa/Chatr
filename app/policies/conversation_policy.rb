class ConversationPolicy < ApplicationPolicy
    attr_reader :user, :conversation

    def initialize(user, conversation)
      @user = user
      @conversation = conversation
    end

    def index?
        @user
    end
    
    def show?
        @user
    end
    
    def create?
        @user
    end
    
    def new?
        create?
    end
    
    def update?
        false
    end

    def edit?
        update?
    end

    def destroy?
        false
    end

end