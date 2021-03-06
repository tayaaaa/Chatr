class LessonPolicy < ApplicationPolicy
    attr_reader :user, :lesson
  
    def initialize(user, lesson)
      @user = user
      @lesson = lesson
    end
  
    def index?
        false
    end
  
    def show?
      false
    end
  
    def create?
        @user and @user.role == Role.where(privilege: 'teacher')[0]
    end
  
    def new?
      create?
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
  