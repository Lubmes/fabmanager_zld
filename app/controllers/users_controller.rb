class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :archive]
    
  def show
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
