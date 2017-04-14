class InformationController < ApplicationController

  def index
  @information = Information.all
  end

  def show
    index
  end

end
