Blog::Application.routes.draw do
  
  get "/posts/search" => "posts#search"
  resources :posts do
    resources :comments
  end
end
