class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :edit, :update, :destroy, :archive]

  def take
    machine = Machine.find(params[:id])
    machine.usage += 1
    machine.save!
    @usage_duration = machine.build_usage_duration
    @usage_duration.duration = 30 * 60
    @usage_duration.user=current_user
    @usage_duration.save!
    redirect_to fabmoment_index_path
  end

  def leave
    machine = Machine.find(params[:id])
    machine.usage -= 1
    machine.save!
    @usage_duration = UsageDuration.find(params[:id])
    @usage_duration.destroy
    redirect_to fabmoment_index_path
  end
end
