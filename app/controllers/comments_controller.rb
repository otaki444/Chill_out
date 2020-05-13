class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
	    post = Post.find(params[:post_image_id])
	    comment = current_user.comments.new(comment_params)
	    comment.post_id = post.id
	    comment.save
	    redirect_to post_path(post)
	end

	private
	def comment_params
	    params.require(:comment).permit(:comment)
	end
end