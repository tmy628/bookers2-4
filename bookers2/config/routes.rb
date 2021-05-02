Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  # relationships は中間テーブルなので、usersモデルにネストさせる

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
