require 'sidekiq/web'

Rails.application.routes.draw do
  resources :services do
    resources :appointments
  end
  namespace :service do
    resources :appointments
  end
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
