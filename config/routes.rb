Rails.application.routes.draw do
  root 'games#index'
  resource :game, only: [:new, :update]
end
