Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'users#index'
  get '/login' => 'users#index', as: 'login'
  get '/register' => 'users#new', as: 'register'
  get '/profile' => 'users#show', as: 'profile' 

  post '/sessions' => 'sessions#create'
  post '/users' => 'users#create'
  get '/posts' => 'posts#index', as: 'posts'

  resources :posts do 
    resources :comments
  end    


end
