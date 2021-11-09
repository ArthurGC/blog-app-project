class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true

  def update_comments_counter
    comment_counter = post.comments.count
    post.update(comments_counter: comment_counter)
  end
end
