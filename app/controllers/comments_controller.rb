class CommentsController < ApplicationController
  before_action :set_ticket

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @ticket
    else
      render :new, status: :unprocessable_entity
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