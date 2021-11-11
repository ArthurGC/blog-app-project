class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @list_of_posts = @user.recent_posts
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
    @post = @current_user.posts.new(posts_params)
    @post.author_id = @user.id
    if @post.save
      @post.update_posts_counter
      redirect_to user_post_path(@user.id,@post)
    else
      render :new
    end
  end

  def posts_params
    params.require(:post).permit(:title, :text)
  end

end
