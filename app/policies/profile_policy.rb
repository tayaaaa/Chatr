class ProfilePolicy < ApplicationPolicy
    attr_reader :user, :profile
  
    def initialize(user, profile)
      @user = user
      @profile = profile
    end
  
    def index?
        false
    end
  
    def show?
       @user
    end
  
    def create?
        new?
    end
  
    def new?
      @user.profile == nil
    end
  
    def update?
        edit?
    end
  
    def edit?
        true
    end
  
    def destroy?
        false
    end

    def finances?
        @user
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
  