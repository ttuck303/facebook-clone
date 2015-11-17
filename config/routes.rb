Rails.application.routes.draw do


  root "static_pages#index"

  devise_for :users

  resources :users, only: :show do
    resources :posts
  end

  resources :likes, only: [:create, :destroy]

  #resources :posts do 
  #  resources :comments
  #end

  delete 'friendships/delete' => 'friendships#destroy', as: :delete_friendship
  get 'friendships/create' => 'friendships#create', as: :create_friendship
  get 'friendships/update' => 'friendships#update', as: :update_friendship

  get '/posts/:post_id/comments/new' => 'comments#new', as: :new_post_comment
  get '/posts/:post_id/comments' => 'comments#index', as: :post_comments
  post '/posts/:post_id/comments' => 'comments#create'

  resources :comments, only: :destroy

end
