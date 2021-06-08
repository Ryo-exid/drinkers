class HomesController < ApplicationController
  def top
    @posts = Post.page(params[:page]).per(4).order("created_at DESC")
  end

  def about
  end
end
