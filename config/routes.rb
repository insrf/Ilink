Rails.application.routes.draw do
  devise_for :users

  root "books#index"

  resources :books, only: %i[index, show] do
    resources :rent_books, shallow: true
  end

  namespace :admin do
    resources :books, shallow: true
  end
end
