class RolesController < ApplicationController
  # before_action :set_authorization, only: [:index]
  before_action :set_roles, only: [:index]
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    authorize Role
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)

    if @role.save
      redirect_to roles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @role.update(role_params)
      redirect_to roles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @role.destroy
    redirect_to roles_path
  end

  private

  def set_authorization
    authorize @role
  end

  def set_roles
    @roles = Role.all
  end

  def set_role
    @role = Role.find_by(id: params[:id])
  end

  def role_params
    params.require(:role).permit(:name, :code)
  end
end
