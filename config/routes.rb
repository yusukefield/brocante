Rails.application.routes.draw do
  root 'home#top'
  
 devise_for :hosts, controllers: {
  #get "sign_in", to: "devise/sessions"
  sessions:      'hosts/sessions',
  passwords:     'hosts/passwords',
  registrations: 'hosts/registrations'
}

  devise_for :users, controllers: {
   sessions: 'users/sessions',
   passwords: 'users/passwords',
   registrations: 'users/registrations'
}

  resources :users, only: [:show, :edit, :update]
  resources :hosts, only: [:show, :edit, :update]
  resources :events

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
