Rails.application.routes.draw do
  get "layouts/login_page", to: "layouts#login_page"
  get "layouts/layout_page", to: "layouts#layout_page"
  get "layouts/signup_page", to: "layouts#signup_page"
  get 'comments/show'
  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'
  get 'users/following'
  get 'users/followers'
  post "relationships/create", to: "relationships#create", as: :create_relationship
  delete "relationships/destroy", to: "relationships#destroy", as: :destroy_relationship
  devise_for :users, controllers: { registrations: "users/registrations"}
  resources :profiles
  resources :likes, only: [:create, :destroy]
  resources :bookmarks, only: [:create, :destroy]
  #post "likes/new", to: "likes#create", as: :likes_path
  resources :relationships
  resources :tweets do
    resources :comments
    member do
      post :retweet, to: "retweets#retweet", as: :retweet_tweet
      get :retweet
    end

    member do 
      get :new_quote, to: "quotes#new_quote", as: :new_quote
      post :quote, to: "quotes#quote", as: :quote_tweet
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "tweets#home"
 resources :users do
  member do
    get :following, :followers
  end
 end
  
end
