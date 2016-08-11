class Admin::FabmomentsController < Admin::ApplicationController

  def destroy
    @fabmoment = Fabmoment.find(params[:id])
    @fabmoment.destroy
    flash[:notice] = "Fabmoment is verwijderd."
    redirect_to fabmoments_path 
  end

end