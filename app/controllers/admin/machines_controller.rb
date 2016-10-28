class Admin::MachinesController < ApplicationController
	before_action :set_machine, only: [:show, :edit, :update, :destroy, :archive]
	def index
		@machines = Machine.all
	end
	def new
		@machine = Machine.new
	end
  def show
  end
  def edit
  end
   def update
    @machine = Machine.find(params[:id])
    if @machine.update(machine_params)
      flash[:notice] = "Machine is succesvol geëdit."
      redirect_to admin_machines_path
    else
      render 'edit'
    end
  end
	def create
		@machine = Machine.new(machine_params)

    if @machine.save
      flash[:notice] = "Machine is succesvol toegevoegd."
      redirect_to admin_machines_path
    else
      flash.now[:alert] = "Machine is niet toegevoegd."
    end
	end
	 def destroy
    @machine = Machine.find(@machine)
    @machine.delete
    flash[:notice] = "Machine is succesvol verwijderd."
    redirect_to admin_machines_path
  end
    def machine_params
    	params.require(:machine).permit(:id,:name,:admin)
    end
    def set_machine
    @machine = Machine.find(params[:id])
  	end
end
