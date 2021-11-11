class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comments_counter
    comment_counter = post.comments.count
    post.update(comments_counter: comment_counter)
  end
end
