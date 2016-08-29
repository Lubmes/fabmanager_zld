class CommentsController < ApplicationController
  before_action :set_fabmoment

  def create
    @comment = @fabmoment.comments.build(comment_params)
    @comment.author = current_user
    authorize @comment, :create?

    if @comment.save
      flash[:notice] = 'Commentaar is succesvol toegevoegd.'
      redirect_to @fabmoment
    else
      flash.now[:alert] = 'Commentaar is niet toegevoegd.'
      render 'fabmoments/show'
    end
  end

  private

  def set_fabmoment
    @fabmoment = Fabmoment.find(params[:fabmoment_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
