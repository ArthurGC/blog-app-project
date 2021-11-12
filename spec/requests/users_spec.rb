require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    @user = User.create(name: 'Alex', photo: 'Photo', bio: 'I am a Front-end developer')
  end

  describe 'GET /index' do
    before { get '/users' }
    it 'receive a ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'A correct template was rendered.' do
      expect(response).to render_template(:index)
    end

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('Alex')
    end
  end

  describe 'GET /show' do
    before { get user_path(@user) }
    it 'receive a ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'A correct template was rendered.' do
      expect(response).to render_template(:show)
    end

    it 'the response body includes correct placeholder text.' do
      expect(response.body).to include('I am a Front-end developer')
    end
  end
end
