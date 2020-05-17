class UsersController < ApplicationController
	before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
    @user_posts = @user.posts.page(params[:page]).reverse_order
    @slide = @user_posts.shuffle

    @current_user_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    if @user.id != current_user.id
      @current_user_entry.each do |current_user|
        @user_entry.each do |user|
          if current_user.room_id == user.room_id then
            @isRoom = true
            @roomId = current_user.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
