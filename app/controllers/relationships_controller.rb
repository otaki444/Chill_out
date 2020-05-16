class RelationshipsController < ApplicationController
	before_action :authenticate_user!
  def follow
  	user = User.find(params[:user_id])
  	@follows = user.follows
  end

  def follower
  	user = User.find(params[:user_id])
    @followers = user.followers
  end

  def create
  	current_user.follow_user(params[:user_id])
    redirect_back(fallback_location: root_url)
  end

  def destroy
  	current_user.unfollow(params[:user_id])
  	redirect_back(fallback_location: root_url)
  end
end
