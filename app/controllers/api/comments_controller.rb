class Api::CommentsController < ApplicationController
    def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments
        render json: @comments
    end

    def create
        @user = current_user
        @comment = @user.comments.new(comments_params)
        @comment.author_id = @user.id
        @comment.post_id = params[:post_id]
        if @comment.save
          flash[:notice] = 'Comment published succesfully'
        else
          flash[:error] = 'Comment was not published'
        end
    end

    def comments_params
        params.require(:comment).permit(:text)
      end
end
