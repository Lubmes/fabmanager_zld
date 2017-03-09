class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user
  end

  def edit?
	user.try(:admin?) || record.author == user  
  end

  def update?
    edit?
  end

  def destroy?
    user.try(:admin?)
  end
end
