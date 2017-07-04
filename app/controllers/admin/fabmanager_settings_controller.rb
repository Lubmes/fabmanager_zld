class Admin::FabmanagerSettingsController < ApplicationController

  def settings
    @settings = FabmanagerSettings.find(1)
    @machines = Machine.all
    render 'show'
  end

  def update
    @settings = FabmanagerSettings.find(1)
    if @settings.update(fabmanager_settings_params)
      flash[:notice] = "Uw gains zijn behaald."
      redirect_back
    else
      flash.now[:alert] = "Uw gains zijn gefaald."
      render 'settings'
    end
  end

  private

  def fabmanager_settings_params
    params.require(:fabmanager_settings).permit(:open_hour, :max_time_to_occupy_machine, :max_machine_to_occupy)
  end
end
