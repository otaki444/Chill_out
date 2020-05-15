class FavoritesController < ApplicationController
	before_action :authenticate_user!
  def index
  	@images = Image.all
  end

  def create
  end

  def destroy
  end
end
