class TagsController < ApplicationController
  def remove
    @fabmoment = Fabmoment.find(params[:fabmoment_id])
    @tag = Tag.find(params[:id])
    authorize @fabmoment, :tag?

    @fabmoment.tags.destroy(@tag)
    head :ok
  end
end
