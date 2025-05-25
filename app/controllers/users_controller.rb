class UsersController < ApplicationController
  before_action :set_users, only: [:index]
  before_action :set_user, only: [:show, :edit, :update]

  def index; end

  def show; end

  def edit; end

  def update
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