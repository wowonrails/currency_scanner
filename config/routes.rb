Rails.application.routes.draw do
  devise_for :admins

  root 'rates#show'

  namespace :admin do
    root 'rates#new'

    resources :rates, only: %w[new create]
  end

  resources :rates, only: :show

  mount ActionCable.server => '/cable'
end
