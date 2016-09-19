Rails.application.routes.draw do

  root 'sessions#new'

  resources :members
  resources :rooms
  resources :topics

  post '/rooms/signup' => 'rooms#signup'
  match '/members/:id/home' => 'members#home', via: :get, as: 'home'

  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  #post '/rooms/:id/signup', to: 'rooms#signup'
  resources :questions

end
