Rails.application.routes.draw do
  resources :decks do
    resources :cards
  end
  devise_for :users
  root 'decks#index'
end
