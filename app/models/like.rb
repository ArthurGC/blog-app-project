class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true

  def update_likes_counter
    like_counter = post.likes.count
    post.update(likes_counter: like_counter)
  end
end
