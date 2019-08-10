class ReplyPolicy < ApplicationPolicy
    attr_reader :user, :reply
  
    def initialize(user, reply)
      @user = user
      @reply = reply
    end
  
    def index?
      false
    end
  
    def show?
      false
    end
  
    def create?
    end
  
    def new?
      create?
    end
  
    def update?
      @user and @user.role == Role.second
    end
  
    def edit?
      false
    end
  
    def destroy?
      false
    end
  
    # class Scope
    #   attr_reader :user, :scope
  
    #   def initialize(user, scope)
    #     @user = user
    #     @scope = scope
    #   end
  
    #   def resolve
    #     scope.all
    #   end
    # end
end
  