class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def show?
    edit?
  end

  def edit?
    @current_user.try(:admin?) or @current_user == @user
  end

  def update?
    edit?
  end

  def archive?
    # return false if @current_user == @user
    @current_user.try(:admin?)
  end
end
