class Admin::ProgramsController < ApplicationController
	before_action :set_program, only: [:show, :edit, :update, :destroy, :archive]
	def index
		@programs = Program.all
	end
	def new
		@programs = Program.new
	end
  def show
  end
  def edit
  end
   def update
    @programs = Program.find(params[:id])
    if @programs.update(programs_params)
      flash[:notice] = "Programma is succesvol geëdit."
      redirect_to admin_programs_path
    else
      render 'edit'
    end
  end
	def create
		@programs = Program.new(programs_params)

    if @programs.save
      flash[:notice] = "Programma is succesvol toegevoegd."
      redirect_to admin_programs_path
    else
      flash.now[:alert] = "Programma is niet toegevoegd."
    end
	end
	 def destroy
    @programs = Program.find(@programs)
    @programs.delete
    redirect_to admin_programs_path
  end
    def programs_params
    	params.require(:program).permit(:id,:name,:admin)
    end
    def set_program
    @programs = Program.find(params[:id])
  	end
	
end