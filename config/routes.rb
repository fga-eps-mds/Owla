Rails.application.routes.draw do

  root 'sessions#new'
  post '/rooms/signup' => 'rooms#signup'

  resources :members
  match '/members/:id/home' => 'members#home', via: :get, as: 'home'
  match '/members/:id/joined' => 'members#joined_rooms', via: :get, as: 'joined_rooms'
  match '/members/:id/myrooms' => 'members#my_rooms', via: :get, as: 'my_rooms'

  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  #post '/rooms/:id/signup', to: 'rooms#signup'
  resources :rooms
  resources :topics
  resources :questions
  resources :answers

end
