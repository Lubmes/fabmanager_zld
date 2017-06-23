class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    create?
  end

  def create?
    user
  end

  def update?
    user.try(:admin?) #|| record.user == user
  end

  def destroy?
    user.try(:admin?)
  end
end