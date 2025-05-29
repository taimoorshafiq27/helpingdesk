class TicketPolicy < ApplicationPolicy
  attr_reader :user, :ticket

  def initialize(user, ticket)
    @user = user
    @ticket = ticket
  end

  def index?
    user
  end

  def new?
    user
  end

  def create?
    user
  end

  def show?
    user
  end

  def edit?
    user.admin? || user.agent?
  end

  def update?
    user.admin? || user.agent?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.agent?
        scope.all
      else
        scope.where(client_id: user.id)
      end
    end
  end
end