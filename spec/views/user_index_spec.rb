require 'rails_helper'

RSpec.describe 'Blog App', type: :feature do
  describe 'user index page' do
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

      Post.create(
        author_id: @user.id,
        title: "Lorenzo' Post",
        text: 'Lorenzo was here. The Lorenzo',
        comments_counter: 0,
        likes_counter: 0
      )
      visit users_path
    end

    it 'users_path show name of users' do
      expect(page).to have_content(@user.name)
    end

    it "users_path show an user's picture" do
      expect(page).to have_css('img', class: 'img_profile')
    end

    it "users_path show the correct user's post_counter" do
      expect(page).to have_content('1')
    end

    it "When I click on a user, I am redirected to that user's show page." do
      click_link('See profile')
      expect(page).to have_current_path(user_path(@user.id))
    end
  end
end
