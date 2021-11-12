class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(posts_params)
    @post.author_id = @user.id
    if @post.save
      redirect_to user_post_path(@user.id, @post)
    else
      render :new
    end
  end

  def posts_params
    params.require(:post).permit(:title, :text)
  end
end
