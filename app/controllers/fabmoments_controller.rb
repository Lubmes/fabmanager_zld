class FabmomentsController < ApplicationController
  def index
    @fabmoments = Fabmoment.all
  end

  def show
    @fabmoment = Fabmoment.find(params[:id])
  end

  def new
    @fabmoment = Fabmoment.new
  end

  def create
    @fabmoment = Fabmoment.new(fabmoment_params)

    if @fabmoment.save
      flash[:notice] = "Fabmoment is succesvol gecreëerd."
      redirect_to @fabmoment
    else
      flash.now[:alert] = "Fabmoment is niet gecreëerd."
      render "new"
    end
  end

  private

  def fabmoment_params
    params.require(:fabmoment).permit(:title, :description)
  end
end
