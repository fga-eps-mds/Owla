Rails.application.routes.draw do

  root 'sessions#new'
  post '/rooms/signup' => 'rooms#signup'
  post '/rooms/signout' => 'rooms#signout'
	post 'moderate_question/:id', to: 'questions#moderate_question', as: 'moderate_question'
  post 'moderate_answer/:id', to: 'answers#moderate_answer', as: 'moderate_answer'

  match '/members/:id/home' => 'members#home', via: :get, as: 'home'
  match '/members/:id/joined' => 'members#joined_rooms', via: :get, as: 'joined_rooms'
  match '/members/:id/myrooms' => 'members#my_rooms', via: :get, as: 'my_rooms'

  resources :members, shallow: true do
    resources :rooms do
        resources :topics do
          resources :questions do
            resources :answers
          end
        end
    end
  end

  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
end
