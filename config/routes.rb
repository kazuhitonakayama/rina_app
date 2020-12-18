Rails.application.routes.draw do
  root "users#mypage"
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'users/bookmark' => 'users#bookmark' 
  resources :users, only: [:show, :index, :mypage,]
 
  resources :places do
    resources :likes, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
  end
  

  resources :users,only: [:show,:index,:mypage,:bookmark]
  resources :genres,only: [:new,:create,:edit,:destroy,:update,:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
