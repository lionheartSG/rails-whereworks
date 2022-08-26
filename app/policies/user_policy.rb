class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def bookings?
    true
  end

  def listings?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record == user
  end
end
