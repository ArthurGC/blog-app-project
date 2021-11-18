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
    response = if @comment.save
                 { comment: @comment }
               else
                 { message: "Comment didn't save" }
               end
    json_response(response)
  end

  def comments_params
    params.permit(:text, :post_id)
  end
end
