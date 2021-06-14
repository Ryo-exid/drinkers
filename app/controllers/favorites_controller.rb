class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @favorite = @post.favorites.create(user_id: current_user.id)
    @favorite.save
    # 通知の作成
    @post.create_notification_by(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = @post.favorites.find_by(post_id: params[:post_id], user_id: current_user.id)
    @favorite.destroy
  end


end
