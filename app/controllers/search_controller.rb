class SearchController < ApplicationController

  def search
    @range = params[:range]
    if @range == "タイトル" || @range == "場所"
      @posts = Post.looks(params[:search], params[:word]).page(params[:page]).reverse_order
    else
      @users = User.looks(params[:search], params[:word])
    end
  end
end
