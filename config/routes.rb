Rails.application.routes.draw do
  get 'google_oauth2', to: redirect('/auth/google_oauth2'), as: 'google_oauth2'
  resource :auth, only: %i[new destroy], controller: 'auth' do
    get 'google_oauth2/callback', to: 'auth#google_oauth2'
  end

  # resources :users
  resources :notes
  root 'notes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
