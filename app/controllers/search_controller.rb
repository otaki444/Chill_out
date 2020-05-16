class SearchController < ApplicationController
	before_action :authenticate_user!

	def search
		@model = params["search"]["model"]
		@content = params["search"]["content"]
  	@records = search_for(@model, @content)
    @posts = @records.page(params[:page]).reverse_order
 	end

  	private
  	def search_for(model, content)
   	  if model == 'user'
       		User.where(nickname: content)
      elsif model == 'post'
        	Post.where('title LIKE ?', '%'+content+'%')
      end
  	end
end
