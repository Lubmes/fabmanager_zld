class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :archive]

  # def edit
  #   @fabmoments = Fabmoment.where(author: @user)
  # end

  # def update
  #   @fabmoments = Fabmoment.where(author: @user)
  # end
    
  def show
    @comments = Comment.where(author: @user)
    @fabmoments = Fabmoment.where(author: @user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
