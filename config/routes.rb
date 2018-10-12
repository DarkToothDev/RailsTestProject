Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :artists, only: [:index, :show]
#resources :pages, only: [:index]

get 'about', to: 'pages#about', as: 'about'

root to: 'pages#index'

end
