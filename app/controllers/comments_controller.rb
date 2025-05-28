class CommentsController < ApplicationController
  before_action :set_ticket

  def create
    @comment = @ticket.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @ticket
    else
      render "tickets/show", status: :unprocessable_entity
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find_by(id: params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end