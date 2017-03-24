class Admin::ReservationsController < ApplicationController

  def index
    @machines = Machine.all
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save!

    begin_time = @reservation.begin_time
    end_time = @reservation.end_time
    # duration = end_time - begin_time

    # hieronder met bookable gem zo ongeveer machine boeken, na ook machine te hebben geselecteerd

    @machine = Machine.last

    current_user.book! @machine, time_start: begin_time, time_end: end_time, amount: 1

    redirect_to admin_reservations_path
  end

  def edit

  end

  def delete
    @reservation = Reservation.delete
  end

  def remove

  end

  private

  def reservation_params
    params.require(:reservation).permit(:description, :user, :machine, :begin_time, :end_time)
  end
end

