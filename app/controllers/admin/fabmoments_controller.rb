class Admin::FabmomentsController < ApplicationController
  before_action :set_fabmoment, only: [:show, :edit, :update, :destroy]

  def index
    @fabmoments = Fabmoment.all
    @machines = Machine.all
    @openingtimes = Openingtime.first
  end


  def staff_pick
    fabmoment = Fabmoment.find(params[:id])
    fabmoment.toggle! :staff_pick
    redirect_to(:back)
  end
end