class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, optional: true

  def update_likes_counter
    like_counter = post.likes.count
    post.update(likes_counter: like_counter)
  end
end
