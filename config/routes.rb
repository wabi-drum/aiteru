Rails.application.routes.draw do
  devise_for :users

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root 'dashboards#index'
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy, :show]
  end 

  devise_scope :user do 
    post 'users/guest_sign_in', to: 'public/users/sessions#guest_sign_in'
  end 
  
  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
    get '/search', to: 'searches#search', as: 'search'
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
