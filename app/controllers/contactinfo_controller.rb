class ContactinfoController < ApplicationController

  def index
  @contactinfo = Contactinfo.all
  end

end
