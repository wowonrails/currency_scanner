Rails.application.routes.draw do
  devise_for :admins

  root 'rates#show'

  authenticated :admin do
    namespace :admin do
      root 'rates#new'

      resources :rates, only: %w[show new create]
    end
  end

  resources :rates, only: :show
end
