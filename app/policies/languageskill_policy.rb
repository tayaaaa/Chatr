class LanguageskillPolicy < ApplicationPolicy
    attr_reader :user, :languageskill
  
    def initialize(user, languageskill)
      @user = user
      @languageskill = languageskill
    end
  
    def index?
        false
    end
  
    def show?
      false
    end
  
    def create?
        @user
    end
  
    def new?
      create?
    end
  
    def update?
        edit?
    end
  
    def edit?
    # @user and languageskill.profile.user_id == @user.id
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
  