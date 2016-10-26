Rails.application.routes.draw do
  #get 'profiles/new'
  get  '/signup',  to: 'profiles#show'
  resources :profiles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
