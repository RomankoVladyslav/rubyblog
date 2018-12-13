Rails.application.routes.draw do
  get 'sessions/new'
root 'posts#index', as: 'home'

get 'about' => 'pages#about', as: 'about'
get 'signup' => 'users#new'
post 'signup' => 'users#create'
get 'login' => 'sessions#new'
post 'login' => 'sessions#create'
delete 'logout' => 'sessions#destroy'
get 'edit' => 'users#edit'
resources :users, only: [:show, :edit]
resources :posts do
  resources :comments
end
end
