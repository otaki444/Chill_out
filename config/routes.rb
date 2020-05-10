Rails.application.routes.draw do

  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'relationships/follow'
  get 'relationships/follower'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
  get 'favorites/index'
  get 'favorites/create'
  get 'favorites/destroy'
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
	# ECサイト
  root to: 'homes#home'
  get 'home/about', to: 'homes#about'

	# 管理者側
  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
