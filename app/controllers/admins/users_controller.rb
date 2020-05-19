class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
  def top
  end

  def index
  end

  def show
  end
end
