class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter
    like_counter = post.likes.count
    post.update(likes_counter: like_counter)
  end
end
