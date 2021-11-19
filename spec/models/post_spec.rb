require 'rails_helper'
require 'faker'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.new(
      email: 'admin@gmail.com',
      password: 'password',
      password_confirmation: 'password',
      name: 'Admin',
      role: 'admin'
    )
    @user.skip_confirmation!
    @user.save!
    @post = @user.posts.create(title: 'I am a title', text: 'I am a text', author_id: @user.id)

    (1..8).each do |_id|
      @post.comments.create(
        author_id: @user.id,
        post_id: @post.id,
        text: 'This is a comment'
      )
    end
  end

  it 'title should be present' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'title should not be greater than 250 characters' do
    @post.title = Faker::Lorem.characters(number: 300)
    expect(@post).to_not be_valid
  end

  it 'commentsCounter should be a integer greater or equal to 0' do
    @post.comments_counter = nil
    expect(@post).to_not be_valid
  end

  it 'likesCounter should be a integer greater or equal to 0' do
    @post.likes_counter = nil
    expect(@post).to_not be_valid
  end

  it 'recentComments should be return 5 comments' do
    expect(@post.recent_comments.length).to be(5)
  end

  it 'PostsCounter should return 1 post' do
    expect(@user.posts.length).to be(1)
  end
end
