class LikesController < ApplicationController
    def create
        @user = current_user
        @post = @user.posts.find(params[:post_id])
        if !already_liked?
            @like = @post.likes.new()
            @like.author_id = @user.id
            @like.post_id = @post.id
            p @like
            if @like.save
                p @like
                @like.update_likes_counter
                redirect_to user_post_path(@user.id,@post)
            end
        else
            redirect_to user_post_path(@user.id,@post)
        end
    end

    def already_liked?
        Like.where(user_id: @user.id, post_id: params[:id]).exists?
      end
end
