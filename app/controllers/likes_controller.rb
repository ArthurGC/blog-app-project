class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    if already_liked?
      redirect_to user_post_path(@user.id, @post)
    else
      @like = @user.likes.new
      @like.author_id = @user.id
      @like.post_id = params[:post_id]
      if @like.save
        @like.update_likes_counter
        redirect_to user_post_path(@user.id, @post)
      end
    end
  end

  def already_liked?
    Like.where(author_id: @user.id, post_id: @post.id).exists?
  end
end
