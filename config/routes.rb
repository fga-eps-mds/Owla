Rails.application.routes.draw do
  post '/rooms/signup' => 'rooms#signup'

  resources :members
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #post '/rooms/:id/signup', to: 'rooms#signup'
  resources :questions
  resources :rooms
  resources :topics 
  resources :questions
  resources :answers

end
