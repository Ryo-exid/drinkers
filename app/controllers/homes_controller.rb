class HomesController < ApplicationController
  def top
    @posts = Post.page(params[:page]).per(6).order("created_at DESC")
    @all_ranks = Post.create_all_ranks
  end

  def about
    render layout: "no-search-application"
  end
end
