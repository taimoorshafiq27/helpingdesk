class AdminScreensController < ApplicationController
  def index
    @roles = Role.all
  end
end