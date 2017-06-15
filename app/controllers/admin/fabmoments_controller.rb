class admin::FabmomentsController < ApplicationController
  before_action :set_fabmoment, only: [:show, :edit, :update, :destroy]


  def bookmark
    fabmoment = Fabmoment.find(params[:id])
  end
end