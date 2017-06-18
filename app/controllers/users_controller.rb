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

  def settings

  end
    
  def edit

  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
  end

    if @user.update(user_params)
      flash[:notice] = "succesvol bijgewerkt."
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "Bijwerken mislukt."
      render "edit"
    end
  end

  def user_params
    params.require(:user).permit(:username, :firstname, :insertion, :lastname, :biography, :adress, :telephone, :email, :password, :admin, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
