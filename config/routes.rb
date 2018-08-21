Rails.application.routes.draw do
  root 'games#new'
  resource :game, only: [:new, :create, :show] do
    resource :board, only: [] do
      resources :cell, only: [:update]
    end
  end
end
