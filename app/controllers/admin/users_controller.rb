class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Gebruiker is succesvol toegevoegd."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "Gebruiker is niet toegevoegd."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
