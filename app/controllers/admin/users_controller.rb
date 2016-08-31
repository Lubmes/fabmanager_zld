class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :archive]

  def index
    @users = User.excluding_archived.order(:email)
  end

  def show
    @comments = Comment.where(author: @user)
    @fabmoments = Fabmoment.where(author: @user)
    render 'users/show'
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

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    if @user.update(user_params)
      flash[:notice] = "Gebruiker is succesvol bijgewerkt."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "Gebruiker is niet bijgewerkt."
      render "edit"
    end
  end

  def archive
    if @user == current_user
      flash[:alert] = 'Je kunt jezelf niet archiveren!'
    else
      @user.archive
      flash[:notice] = 'Gebruiker is gearchiveerd.'
    end

    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
