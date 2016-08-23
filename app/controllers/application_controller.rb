class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def not_authorized
    redirect_to root_path, alert: "Je hebt geen toestemming om dat te doen."
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar, :avatar_cache, :remove_avatar, :first_name, :surname, :date_of_birth, :gender, :country, :province, :city])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar, :avatar_cache, :remove_avatar, :first_name, :surname, :date_of_birth, :gender, :country, :province, :city])
    # devise_parameter_sanitizer.permit(:edit, keys: [:username, :avatar, :avatar_cache, :remove_avatar, :first_name, :surname, :date_of_birth, :gender, :country, :province, :city])
  end
end
