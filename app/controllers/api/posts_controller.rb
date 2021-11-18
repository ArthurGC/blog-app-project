class Api::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts
    render json: @post
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end
end
