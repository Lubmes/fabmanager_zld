class OpenhoursController < ApplicationController

  def show
    @openhours = Openhour.all
  end

  def create
    @user = current_user
    @machines = Machines.all
    @openhours = Openhour.new(openhour_params)
    authorize @openhour

  end

  private

  def openhour_params
    params.require(:openhour).permit(:user_username, :machine_ids => [])
  end

end
