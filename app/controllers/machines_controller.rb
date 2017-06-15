class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :edit, :update, :destroy, :archive]

  def take
    machine = Machine.find(params[:id])
    machine.usage += 1
    machine.save!
    redirect_to fabmoment_index_path
  end

  def leave
    machine = Machine.find(params[:id])
    machine.usage -= 1
    machine.save!
    redirect_to fabmoment_index_path
  end
end
