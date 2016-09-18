Rails.application.routes.draw do

  root 'sessions#new'
<<<<<<< HEAD
=======
  post '/rooms/signup' => 'rooms#signup'
>>>>>>> Creating login form based on AdminLTE template

  resources :members

  post '/rooms/signup' => 'rooms#signup'
  match '/members/:id/home' => 'members#home', via: :get, as: 'home'

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
