require 'rails_helper'

RSpec.describe 'Blog App', type: :feature do
  describe 'post show page' do
    before :each do
      @user1 = User.new(
        email: 'admin@gmail.com',
        bio: 'Lorenzo is my partner',
        password: 'password',
        password_confirmation: 'password',
        name: 'Admin',
        role: 'admin'
      )
      @user1.skip_confirmation!
      @user1.save!

      @user2 = User.new(
        email: 'fulano@gmail.com',
        bio: 'Fulano is my name',
        password: 'password',
        password_confirmation: 'password',
        name: 'Fulano',
        role: 'default'
      )
      @user2.skip_confirmation!
      @user2.save!

      @post = Post.create(
        author_id: @user1.id,
        title: "Lorenzo' Post 1",
        text: 'Lorenzo was here. The Lorenzo 1',
        comments_counter: 0,
        likes_counter: 0
      )

      @comment1 = Comment.create(
        author_id: @user1.id,
        post_id: @post.id,
        text: 'Capybaras are cool'
      )

      @comment2 = Comment.create(
        author_id: @user2.id,
        post_id: @post.id,
        text: 'Capybaras are bad'
      )
      visit user_post_path(@user1.id, @post.id)
    end

    it "I can see the post's title." do
      expect(page).to have_content(@post.title)
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_content(@user1.name)
    end

    it 'I can see how many comments it has.' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'I can see how many likes it has.' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'I can see the post body.' do
      expect(page).to have_content(@post.text)
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content('Admin:')
      expect(page).to have_content('Fulano:')
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
    end
  end
end
