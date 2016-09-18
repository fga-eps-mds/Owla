Rails.application.routes.draw do

  root 'sessions#new'
  post '/rooms/signup' => 'rooms#signup'

  resources :members
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #post '/rooms/:id/signup', to: 'rooms#signup'

  resources :rooms
  resources :topics

end
