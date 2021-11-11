class LikesController < ApplicationController
    def create
        @user = current_user
        @post = @user.posts.find(params[:post_id])
        @like = @post.likes.new(likes_params)
        @like.author_id = @user.id
        @like.post_id = @post.id
        if @comment.save
            redirect_to user_post_path(@user.id,@post)
        end
    end

    def likes_params
        params.require(:like)
    end
end
