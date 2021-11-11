class CommentsController < ApplicationController
    def new; end
    
    def create
        @user = current_user
        @post = @user.posts.find(params[:post_id])
        @comment = @post.comments.create(comments_params)
        @comment.author_id = @user.id
        @comment.post_id = @post.id
        if @comment.save
            redirect_to user_post_path(@user.id,@post)
        else
            render :new
        end
    end

    def comments_params
        params.require(:comment).permit(:text)
    end

end
