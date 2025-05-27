class UsersController < ApplicationController
  before_action :set_users, only: [:index]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    authorize User
  end

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update_role(params[:user][:role_id])
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_users
    @users = User.all
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end