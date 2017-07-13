class Admin::FabmanagerSettingsController < ApplicationController

  def settings
    # FabmanagerSettings.delete_all
    # @settings = FabmanagerSettings.create(id:1, open_hour: false, max_time_to_occupy_machine:30*60, max_machines_to_occupy:1 )
    @settings = FabmanagerSettings.find(1)
    @machines = Machine.all
    render 'show'
  end

  def update
    @settings = FabmanagerSettings.find(1)
    if @settings.update(fabmanager_settings_params)
      @settings.save
      flash[:notice] = "Uw wijzigingen zijn opgeslagen."
      redirect_back(fallback_location: admin_fabmanager_setting_path)
    else
      flash.now[:alert] = "Uw wijzigingen zijn niet opgeslagen."
      render 'settings'
    end
  end

  private

  def fabmanager_settings_params
    params.require(:fabmanager_settings).permit(:open_hour, :max_time_to_occupy_machine, :max_machines_to_occupy)
  end
end
