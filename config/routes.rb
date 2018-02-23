Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'movie#index'
  get 'movies' => 'movie#index', as: :movie
  get 'book/:id' => 'show#book', as: :book
  get 'page/:id' => 'show#page', as: :page
  get 'watch/:id' => 'show#watch', as: :watch
  post 'book/:id' => 'show#book_ticket', as: :book_ticket
end
