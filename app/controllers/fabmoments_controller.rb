class FabmomentsController < ApplicationController
  before_action :set_fabmoment, only: [:show, :edit, :update, :destroy]
  before_action :set_programs, only: [:new, :create, :edit, :update]
  before_action :set_machines, only: [:new, :create, :edit, :update]
  before_action :set_materials, only: [:new, :create, :edit, :update]

  def index
    @fabmoments = Fabmoment.all
    @machines = Machine.all
    @openingtimes = Openingtime.first
  end

  def show
    @comment = @fabmoment.comments.build
  end

  def new
    @fabmoment = Fabmoment.new
  end

  def create
    @fabmoment = Fabmoment.new(fabmoment_params)
    @fabmoment.author = current_user

    if @fabmoment.save
      if params[:images]
        params[:images].each do |image|
          @fabmoment.pictures.create(image: image)
        end
      end
      if params[:files]
        params[:files].each do |file|
          @fabmoment.project_files.create(file: file)
        end
      end
      flash[:notice] = "Fabmoment is succesvol toegevoegd."
      redirect_to @fabmoment
    else
      flash.now[:alert] = "Fabmoment is niet toegevoegd."
      render "new"
    end
  end

  def edit
    authorize @fabmoment, :edit?
  end

  def update
    if @fabmoment.update(fabmoment_params) 
      if params[:images]
        params[:images].each do |image|
          @fabmoment.pictures.create(image: image)
        end
      end
      if params[:files]
        params[:files].each do |file|
          @fabmoment.project_files.create(file: file)
        end
      end
      flash[:notice] = "Fabmoment is bijgewerkt."
      redirect_to @fabmoment
    else
      flash.now[:alert] = "Fabmoment is niet bijgewerkt."
      render "edit"
    end
  end

  def destroy
    authorize @fabmoment, :destroy?
    @fabmoment.destroy
    flash[:notice] = "Fabmoment is verwijderd."
    #redirect_to fabmoments_path 
  end

  def search
    if params[:search].present?
      @fabmoments = Fabmoment.all.search(params[:search])
    else
      @fabmoments = Fabmoment.all
    end
    render 'fabmoments/index'
  end

  private


  def fabmoment_params
    params.require(:fabmoment).permit(:title, :description, :source, :gingGoed, :gingFout, :kanBeter,  :license_id, :tag_names,
      :program_ids => [], :machine_ids => [], :material_ids => [], pictures_attributes: [:image], project_files_attributes: [:file] )
  end

  def set_fabmoment
    @fabmoment = Fabmoment.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Het fabmoment waar je naar zocht is niet hier."
    redirect_to fabmoments_path
  end

  def set_programs
    @programs = Program.all
  end

  def set_machines
    @machines = Machine.all
  end

  def set_materials
    @materials = Material.all
  end
end