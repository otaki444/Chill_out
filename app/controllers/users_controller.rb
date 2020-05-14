class UsersController < ApplicationController
	before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
    @user_posts = @user.posts.page(params[:page]).reverse_order
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
