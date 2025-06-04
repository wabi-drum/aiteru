Rails.application.routes.draw do
  namespace :public do
    get 'post_comments/create'
    get 'post_comments/destroy'
  end
  devise_for :users
  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
