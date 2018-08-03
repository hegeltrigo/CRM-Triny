class UserPolicy < ApplicationPolicy

  def index?
    user.super_admin?
  end
  
  def create?
    user.super_admin?
  end
end
