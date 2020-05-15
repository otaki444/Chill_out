class ImagesController < ApplicationController
	before_action :authenticate_user!
	def index
		@images = Image.all
	end
end
