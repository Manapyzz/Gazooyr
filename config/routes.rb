Rails.application.routes.draw do
  devise_for :profiles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :gazooies, only: [:index, :show ,:create]
  get 'profile/:username' => 'profile#show', as: :profile
  get 'profile/:username/edit' => 'profile#edit', as: :edit
  put 'profile/:username' => 'profile#update', as: :update

  resources :news
  resources :comments



end
