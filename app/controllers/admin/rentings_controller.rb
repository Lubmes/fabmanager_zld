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

    # time_start = DateTime.strptime(@renting.time_start, '%Y-%m-%d %H:%M' )

    self.time_start = DateTime.new(
        params["time_start(1i)"].to_i,
        params["time_start(2i)"].to_i,
        params["time_start(3i)"].to_i,
        params["time_start(4i)"].to_i,
        params["time_start(5i)"].to_i
    )

    self.time_end = DateTime.new(
        params["time_end(1i)"].to_i,
        params["time_end(2i)"].to_i,
        params["time_end(3i)"].to_i,
        params["time_end(4i)"].to_i,
        params["time_end(5i)"].to_i
    )

# duration = end_time - begin_time

# hieronder met bookable gem zo ongeveer machine boeken, na ook machine te hebben geselecteerd


    @machine = Machine.last

    current_user.book! @machine, time_start: @renting.time_start, time_end: @renting.time_end, amount: 1

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

