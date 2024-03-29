Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
  resources :events do
  resources :joins, only: [:create, :destroy]
  end
  resources :articles do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
