class Admin::RentingsController < ApplicationController

  def index
    @machines = Machine.all
    @renting = Renting.all
  end

  def new
    @renting = Renting.new
  end

  def create
    @renting = Renting.new(renting_params)
    @renting.save!

    time_start = DateTime.strptime(@renting.time_start, '%Y-%m-%d %H:%M' )
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
    params.require(:renting).permit(:description, :user, :machine, :time_start, :time_end)
  end

end