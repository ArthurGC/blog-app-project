require 'rails_helper'

RSpec.describe 'Blog App', type: :feature do
  describe 'post index page' do
    before :each do
      @user = User.new(
        email: 'admin@gmail.com',
        bio: 'Lorenzo is my partner',
        password: 'password',
        password_confirmation: 'password',
        name: 'Admin',
        role: 'admin'
      )
      @user.skip_confirmation!
      @user.save!

      @post = Post.create(
        author_id: @user.id,
        title: 'Lorenzo Post 1',
        text: 'Lorenzo was here. The Lorenzo 1',
        comments_counter: 0,
        likes_counter: 0
      )

      @comment1 = Comment.create(
        author_id: @user.id,
        post_id: @post.id,
        text: 'Capybaras are cool'
      )

      @comment2 = Comment.create(
        author_id: @user.id,
        post_id: @post.id,
        text: 'Capybaras are bad'
      )

      visit user_posts_path(@user.id)
    end

    it "user_posts_path show an user's picture" do
      expect(page).to have_css('img', class: 'img_profile')
    end

    it 'user_posts_path show name of users' do
      expect(page).to have_content(@user.name)
    end

    it "user_posts_path show the correct user's post_counter" do
      expect(page).to have_content(@user.posts_counter)
    end

    it 'user_posts_path shows the recent posts' do
      expect(page).to have_content(@post.title)
    end

    it 'user_posts_path shows the comments' do
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
    end

    it 'user_posts_path shows the comments counter' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'user_posts_path shows the likes counter' do
      expect(page).to have_content(@post.likes_counter)
    end

    it "When I click on a post, it redirects me to that post's show page." do
      click_link('Lorenzo Post 1')
      expect(page).to have_current_path(user_post_path(@user.id, @post.id))
    end
  end
end
