Rails.application.routes.draw do

	devise_for :users, controllers: {
	  sessions:      'users/sessions',
	  passwords:     'users/passwords',
	  registrations: 'users/registrations'
	}
	devise_for :admins, controllers: {
	  sessions:      'admins/sessions',
	  passwords:     'admins/passwords',
	  registrations: 'admins/registrations'
	}

	# 管理者側
  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
    resources :tags, only: [:index, :create, :destroy]
  end

  # ECサイト
  root to: 'homes#home'
  get '/about', to: 'homes#about'
  get "/search" => "search#search"

  resources :users, only: [:show, :edit, :update, :destroy] do
    get 'follow', to: 'relationships#follow'
    get 'follower', to: 'relationships#follower'
    resource :relationships, only: [:create, :destroy]
    resources :images, only: [:index]
  end

  resources :posts, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy] #いいね
    resource :favorites, only: [:create, :destroy] #お気に入り
    resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
