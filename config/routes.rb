Rails.application.routes.draw do
  root "maps#index"
  resources :maps
  get 'bye', to: 'maps#bye', as: :bye
  get '/admin', to: 'maps#admin', as: :admin
  get '/dev', to: 'maps#dev', as: :dev
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
