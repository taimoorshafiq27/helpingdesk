class TicketsController < ApplicationController
  before_action :set_tickets, only: [:index]
  before_action :set_ticket, only: [:show, :edit, :update]

  def index
    authorize Ticket
  end

  def new
    @ticket = Ticket.new
    @user_role = current_user.roles.first
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)

    @ticket.client = current_user if current_user.client?

    authorize @ticket

    if @ticket.save
      TicketMailer.ticket_creation_notification(@ticket.client, @ticket).deliver_later
      redirect_to @ticket
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = @ticket.comments.build
    authorize @ticket
  end

  def edit
    authorize @ticket
  end

  def update
    authorize @ticket

    if @ticket.update(ticket_params)
      redirect_to tickets_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_tickets
    @tickets = if current_user.admin? || current_user.agent?
                 Ticket.all
               else
                 Ticket.where(client_id: current_user.id)
               end

    @pagy, @tickets = pagy(@tickets.order(created_at: :desc))
  end

  def set_ticket
    @ticket = Ticket.find_by(id: params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:client_id, :assignee_id, :title, :description, :category, :status, comment_attributes: [:id, :body])
  end
end
