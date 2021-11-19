require 'rails_helper'

RSpec.describe 'Blog App', type: :feature do
  describe 'user show page' do
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

      @post1 = Post.create(title: 'article 1', text: 'My text 1', author_id: @user.id)
      @post2 = Post.create(title: 'article 2', text: 'My text 2', author_id: @user.id)
      @post3 = Post.create(title: 'article 3', text: 'My text 3', author_id: @user.id)
      visit user_path(@user.id)
    end

    it "user_path show an user's picture" do
      expect(page).to have_css('img', class: 'img_profile')
    end

    it 'user_path show name of users' do
      expect(page).to have_content(@user.name)
    end

    it "user_path show the correct user's post_counter" do
      expect(page).to have_content(@user.posts_counter)
    end

    it "user_path show the correct user's bio" do
      expect(page).to have_content(@user.bio)
    end

    it 'user_path shows the 3 recent posts' do
      expect(page).to have_content(@post1.title)
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
    end

    it "When I click on a user, I am redirected to that user's show page." do
      expect(has_link?('See all posts')).to be(true)
    end

    it "When I click a user's post, it redirects me to that post's show page." do
      click_link("article 1")
      expect(page).to have_current_path(user_post_path(@user.id, @post1.id))
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user.id))
    end
  end
end
