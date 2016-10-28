class Admin::MaterialsController < ApplicationController
	before_action :set_material, only: [:show, :edit, :update, :destroy, :archive]
	def index
		@materials = Material.all
	end
	def new
		@materials = Material.new
	end
  def show
  end
  def edit
  end
     def update
    @material = Material.find(params[:id])
    if @material.update(material_params)
      flash[:notice] = "Machine is succesvol geëdit."
      redirect_to admin_materials_path
    else
      render 'edit'
    end
  end
	def create
		@materials = Material.new(material_params)

    if @materials.save
      flash[:notice] = "Matriaal is succesvol toegevoegd."
      redirect_to admin_materials_path
    else
      flash.now[:alert] = "Matriaal is niet toegevoegd."
    end
	end
	 def destroy
    @materials = Material.find(@materials)
    @materials.delete
    redirect_to admin_materials_path
  end
    def material_params
    	params.require(:material).permit(:id,:sort,:name,:thickness,:admin)
    end
    def set_material
    @materials = Material.find(params[:id])
  	end
end