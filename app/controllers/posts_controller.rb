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
    new_post = Post.create(title: params[:post][:title], text: params[:post][:text], author_id: self.current_user.id)
    respond_to do |format| 
      format.html do 
        if new_post.save
          flash[:notice] = "Saved successfully"
          redirect_to "/users/#{new_post.author_id}/posts/#{new_post.id}"
        else
          flash[:error] = "error"
          render :new
        end
      end
    end
  end

end
