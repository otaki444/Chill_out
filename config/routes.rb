Rails.application.routes.draw do

	devise_for :users, controllers: {
	  sessions:      'users/sessions',
	  passwords:     'users/passwords',
	  registrations: 'users/registrations'
	}
	devise_for :admins, controllers: {
	  sessions:      'admins/sessions'
	}

	# 管理者側
  namespace :admins do
    get 'top', to: 'users#top'
    resources :users, only: [:index, :show, :edit, :update]
  end

  # ECサイト
  root to: 'homes#home'
  get '/about', to: 'homes#about'
  get '/search', to: 'search#search'
  get '/messages/create', to: 'messages#create'
  get '/rooms/create', to: 'rooms#create'
  get '/rooms/show', to: 'rooms#show'

  resources :users, only: [:show, :edit, :update] do
    get '/follow', to: 'relationships#follow'
    get '/follower', to: 'relationships#follower'
    get '/password/edit', to:"users#password_edit"
    patch '/password/edit' ,to: "users#password_update"
    get '/status', to: 'users#status'
    patch '/status', to: 'users#status_update'
    resource :relationships, only: [:create, :destroy]
  end
  resources :inquiries, only: [:create]
  resources :messages, only: [:create] #DM機能
  resources :rooms, only: [:create,:show]

  resources :posts, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy] #いいね
    resource :favorites, only: [:create, :destroy] #お気に入り
    resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
