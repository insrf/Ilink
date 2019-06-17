Rails.application.routes.draw do
  devise_for :users

  root "books#index"

  resources :books, only: %i[index, show]
  resources :rent_books

  get "search_books" => "rent_books#search"

  namespace :admin do
    resources :books, shallow: true
  end
end
