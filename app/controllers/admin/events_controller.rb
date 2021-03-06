class Admin::EventsController < ApplicationController
  include GoogleAPI
  before_action :set_event, only: [:approved, :show, :edit, :update, :destroy]



    def index
      @events = Event.all
    end

  def show

  end

    def approved
      @event.approved = true
      @event.save!

@event.add_to_google

    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :end_time, :machine_ids => [])
    end
end