class TicketsController < ApplicationController
  before_action :set_tickets, only: [:index]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index; end

  def new
    @ticket = Ticket.new
    @user_role = current_user.roles.first
  end

  def create
    @ticket = Ticket.new(ticket_params)

    @ticket.client = current_user if current_user.client?

    if @ticket.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @ticket.update(ticket_params)
      redirect_to tickets_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def set_tickets
    @pagy, @tickets = pagy(Ticket.all)
  end

  def set_ticket
    @ticket = Ticket.find_by(id: params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:client_id, :assignee_id, :title, :description, :category, :status)
  end
end
