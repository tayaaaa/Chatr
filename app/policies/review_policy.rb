class ReviewPolicy < ApplicationPolicy
    attr_reader :user, :review
  
    def initialize(user, review)
      @user = user
      @review = review
    end
  
    def index?
        false
    end
  
    def show?
        false
    end
  
    def create?
        new?
    end
  
    def new?
      false
    end
  
    def update?
        new?
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
  