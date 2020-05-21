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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:update] = "登録内容を変更しました"
        redirect_to user_path(@user.id)
      else
        @userfind = User.find(params[:id])
        flash.now[:alert] = '変更に失敗しました'
        render :edit
      end
  end

  def password_edit
    @user = current_user
  end

  def password_update
    @user = current_user
    if @user.update(password_params)
      flash[:notice] = 'パスワードを変更しました。'
      redirect_to root_path
    else
      @userfind = current_user
      flash.now[:alert] =  'パスワードが変更できませんでした。'
      render :password_edit
    end
  end

  def status
    @user = current_user
  end

  def status_update #退会アクション
    @user = current_user
    @user.update(come_out: true)
    reset_session
    flash[:alert] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def user_params
      params.require(:user).permit(:name, :name_kana, :nickname, :profile_image, :introduction ,:one_word, :email)
  end

  def password_params
      params.require(:user).permit(:password, :password_confirmation)
  end
end
