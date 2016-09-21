Rails.application.routes.draw do
  post '/rooms/signup' => 'rooms#signup'

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
  delete '/logout',  to: 'sessions#destroy'

  #post '/rooms/:id/signup', to: 'rooms#signup'

end
