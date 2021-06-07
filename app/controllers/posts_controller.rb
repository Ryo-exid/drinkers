class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :post_image, :caption, :location)
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
end
