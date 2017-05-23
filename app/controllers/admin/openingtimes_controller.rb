class OpeningtimesController < ApplicationController


  def update
  @openingtimes = Openingtime.find(params[:id])

    if @openingtimes.update(openingtimes_params)
      flash[:notice] = "Openingstijden zijn bijgewerkt."
    else
      flash.now[:alert] = "Bijwerken mislukt."
    end
  end

  def delete
  end

  private

  def openingtimes_params
    params.require(:openingtimes).permit(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
  end
end
