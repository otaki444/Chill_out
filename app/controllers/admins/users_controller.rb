class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
  def top
  	@user_count = User.where("Date(created_at) = '#{Date.today}'").count
  end

  def index
    case params[:user_case]
    when "today"
      @users = User.where("Date(created_at) = '#{Date.today}'").page(params[:page])
    when "all"
      @users = User.page(params[:page])
    end
  end

  def show
  	@user = User.find(params[:id])
  end
end
