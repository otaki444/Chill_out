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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :article, images_images: [])
  end
end
