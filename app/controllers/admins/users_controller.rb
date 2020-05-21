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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更しました"
      redirect_to admins_user_path(@user.id)
    else
      @user = User.find(params[:id])
      flash.now[:alert] = '変更に失敗しました'
      render :edit
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :name_kana, :nickname, :profile_image, :introduction ,:one_word, :email, :come_out)
  end
end
