Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'works#index'
  # get 'works/category', to: 'works#category', as: 'category'
  get 'works/movies', to: 'works#movies', as: 'movies'
  get 'works/books', to: 'works#books', as: 'books'
  get 'works/albums', to: 'works#albums', as: 'albums'

  resources :works

  post '/works/:id/votes', to: 'votes#create', as: 'new_vote'
  resources :votes, only: [:show, :new]

  get '/login', to: 'users#login', as: 'login'
  resources :users, only: [:index, :show, :login, :create]



end
