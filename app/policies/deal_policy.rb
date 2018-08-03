class DealPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.super_admin?
        scope.all
      elsif user.admin?
        scope.where(user_id: user.id)
      end
    end
  end

  def update?
    # user.admin? or not post.published?
  end
end
