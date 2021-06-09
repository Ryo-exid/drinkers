class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @favorite = @post.favorites.create(user_id: current_user.id)
    @favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = @post.favorites.find_by(post_id: params[:post_id], user_id: current_user.id)
    @favorite.destroy
  end
end
