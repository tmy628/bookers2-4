Rails.application.routes.draw do
  devise_for :users

  resources :homes, only:[:new, :cerate, :show]

  resources :users

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  root 'homes#index'
  # homes/indexに遷移

  get 'home/about' => 'homes#show', as: 'about'

end
