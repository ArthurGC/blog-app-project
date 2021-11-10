class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @list_of_posts = @user.recent_posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
  end
end
