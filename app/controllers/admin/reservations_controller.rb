class Admin::ReservationsController < ApplicationController

  def index
    @machines = Machine.all
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @machine = Machine.find(9)
    @machine.schedule = IceCube::Schedule.new(Time.now, duration: 10.hours)
# This machine is available every day at 8AM till 6PM
    @machine.schedule.add_recurrence_rule IceCube::Rule.weekly.day(:monday, :tuesday, :wednesday, :thursday, :friday).hour_of_day(8).minute_of_hour(30)
    @machine.save!


    # Next Monday from 8AM for 30 minutes
    from_ok = Date.today.next_week + 8.hours
    to_ok = from_ok + 30.minutes
    # reservation = Reservation.new(reservation_params)
    @user = User.find(1)
    @user.book! @machine, time_start: from_ok, time_end: to_ok

    @machine = Machine.new()
    @machine.capacity = 6
    @machine.save!

    @machine.save!

    redirect_to admin_reservation_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:description, :user, :machine, :begintime, :endtime)
  end

end

