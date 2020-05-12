class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
    @post = Post.new
    @post.images.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
        redirect_to posts_path
    else
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to post_path(@post.id)
      else
        @postfind = Post.find(params[:id])
        render :edit
      end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end

  private
  def post_params
    params.require(:post).permit(:title, :article, images_images: [])
  end
end
