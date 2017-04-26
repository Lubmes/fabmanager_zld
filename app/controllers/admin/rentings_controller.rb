class Admin::RentingsController < ApplicationController

  before_action :set_machines, only: [:index, :new, :create, :edit, :update]

  def index
    @renting = Renting.all
  end

  def new
    @renting = Renting.new
  end

  def create
    @renting = Renting.new(renting_params)
    @renting.save!


     #time_start = DateTime.strptime(@renting.time_start, '%Y-%m-%d %H:%M' )

    # @renting.time_start = Time.new(
    #     params[:renting]["time_start(1i)"].to_i,
    #     params[:renting]["time_start(2i)"].to_i,
    #     params[:renting]["time_start(3i)"].to_i,
    #     params[:renting]["time_start(4i)"].to_i,
    #     params[:renting]["time_start(5i)"].to_i
    # )
    # #
    # @renting.time_end = Time.new(
    #     params[:renting]["time_end(1i)"].to_i,
    #     params[:renting]["time_end(2i)"].to_i,
    #     params[:renting]["time_end(3i)"].to_i,
    #     params[:renting]["time_end(4i)"].to_i,
    #     params[:renting]["time_end(5i)"].to_i
    # )

# duration = end_time - begin_time

# hieronder met bookable gem zo ongeveer machine boeken, na ook machine te hebben geselecteerd


     @machine = Machine.first_or_initialize(name: "3D printer ZLD")
     @machine.schedule = IceCube::Schedule.new(Time.now, duration: 1.hours)
     @machine.schedule.add_recurrence_rule IceCube::Rule.daily.hour_of_day(8, 18)
     @machine.capacity = 4
     @machine.save!

     current_user.book! @machine, time_start: Date.today + 22.hours, time_end: Date.today - 24.hours, amount: 1

    # flash[:notice] = "#{params[:renting]["time_start(1i)"].to_i}, #{params[:renting]["time_start(2i)"].to_i}, #{params[:renting]["time_start(3i)"].to_i}, #{params[:renting]["time_start(4i)"].to_i}, #{params[:renting]["time_start(5i)"].to_i}"
    flash[:notice] = "#{@renting.time_start}"
    redirect_to admin_rentings_path
  end


  def edit

  end

  def delete
    @renting = Renting.delete
  end

  def remove

    redirect_to admin_rentings_path
  end

  private

  def renting_params
    params.require(:renting).permit(:description, :user, :time_start, :time_end, :machine_ids => [])
  end

  def set_machines
    @machines = Machine.all
  end

end

