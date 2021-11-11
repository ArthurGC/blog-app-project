class LikesController < ApplicationController
    def create
        @user = current_user
        @post = @user.posts.find(params[:post_id])
        @like = @post.likes.new
        @like.author_id = @user.id
        @like.post_id = @post.id
        if @like.save
            @like.update_likes_counter
            redirect_to user_post_path(@user.id,@post)
        end
    end
end
