Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
  resources :posts, only: [:new, :create]
  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
    namespace "api", defaults: { format: :json } do
      resources :users do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end

end
