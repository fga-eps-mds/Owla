Rails.application.routes.draw do

  root 'sessions#new'

  resources :members
  resources :rooms
  resources :topics

  post '/rooms/signup' => 'rooms#signup'

  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  #post '/rooms/:id/signup', to: 'rooms#signup'


end
