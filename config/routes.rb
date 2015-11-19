Rails.application.routes.draw do


  root "static_pages#index"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", sessions: "users/sessions", registrations: 'users/registrations'  } 

  resources :posts, only: [:new, :create, :destroy]
  resources :users, only: [:index, :show]
  resources :posts, only: :index
  resources :likes, only: [:create, :destroy]

  delete 'friendships/delete' => 'friendships#destroy', as: :delete_friendship
  get 'friendships/create' => 'friendships#create', as: :create_friendship
  get 'friendships/update' => 'friendships#update', as: :update_friendship

  get '/posts/:post_id/comments/new' => 'comments#new', as: :new_post_comment
  get '/posts/:post_id/comments' => 'comments#index', as: :post_comments
  post '/posts/:post_id/comments' => 'comments#create'

  resources :comments, only: [:destroy, :edit, :update]

end
