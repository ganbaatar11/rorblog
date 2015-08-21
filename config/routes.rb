Blog::Application.routes.draw do

  root :to => "posts#index"
  
  devise_for :users

  get "/posts/search" => "posts#search"
  resources :posts do
    resources :comments
  end
end
