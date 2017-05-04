class Admin::RentingsController < ApplicationController

  require 'icalendar'

  before_action :set_machines, only: [:index, :new, :create, :edit, :update]

  def index
    @renting = Renting.all
  end

  # GET /rentings/1
  # GET /rentings/1.json

  def new
    @renting = Renting.new
  end

  def create
    @renting = Renting.new(renting_params)
    @renting.save!

cal = Icalendar::Calendar.new

    event = Icalendar::Event.new
    event.dtstart = @renting.time_start
    event.dtend = @renting.time_end
    event.summary = @renting.description
    cal.add_event(event)

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

