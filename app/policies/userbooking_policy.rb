class UserbookingPolicy < ApplicationPolicy
    attr_reader :user, :userbooking
  
    def initialize(user, userbooking)
      @user = user
      @userbooking = userbooking
    end
  
    def index?
        @user
    end
  
    def show?
      false
    end
  
    def create?
        @user and @user.role.privilege == "student"
    end
  
    def new?
      create?
    end

    def completelesson?
        # @user and @user.id == Userbooking.find(params[:id]).user_id and Userbooking.completedstu == false
        @user
    end
  
    def update?
        false
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
  