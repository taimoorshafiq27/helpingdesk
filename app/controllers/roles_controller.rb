class RolesController < ApplicationController
  before_action :set_roles, only: [:index]
  before_action :set_role, only: [:show, :edit, :update]

  def index
    authorize Role
  end

  def new
    @role = Role.new
    authorize @role
  end

  def create
    @role = Role.new(role_params)
    authorize @role

    if @role.save
      redirect_to roles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @role
  end

  def edit
    authorize @role
  end

  def update
    authorize @role

    if @role.update(role_params)
      redirect_to roles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

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
