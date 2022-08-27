class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    (record.listing.user == user) || (record.user == user)
  end

  def create?
    true
  end

  def confirm?
    (record.listing.user == user) || (record.user == user)
  end

  def cancel?
    (record.listing.user == user) || (record.user == user)
  end
end
