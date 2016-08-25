class FabmomentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def update?
    user.try(:admin?) || record.author == user
  end

  def destroy?
    user.try(:admin?)
  end

  def project_file?
    update?
  end

  def tag?
    update?
  end
end