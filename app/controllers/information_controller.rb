class InformationController < ApplicationController

  def show
  @information = Information.all
  end

end
