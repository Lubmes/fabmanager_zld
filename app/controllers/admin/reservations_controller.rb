class Admin::ReservationsController < ApplicationController

  def index
    @machines = Machine.all
  end

  def new
    reservation = Reservation.new
  end

  def create
    reservation = Reservation.new(reservation_params)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:description, :user)
  end

end

