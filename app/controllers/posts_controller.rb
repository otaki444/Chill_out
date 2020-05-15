class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.page(params[:page]).reverse_order
    @post = Post.new
    @post.post_images.build
  end

  def create
    @post = Post.new(title: params[:post][:title], article: params[:post][:article])
    @post.user_id = current_user.id
    if @post.save
       @post.add_images(params[:images_attributes][:"0"][:image])
       redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
      @posts = Post.page(params[:page]).reverse_order
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:notice] = "変更しました"
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
    params.require(:post).permit(:title, :article, {post_images_images: []})
  end
end
