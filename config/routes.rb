Rails.application.routes.draw do
  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  #get 'boards/show', to: 'comments#new'

  resources :users, only: %i[new create]
  resources :boards, only: %i[index create new show] do
    resources :comments, only: %i[create], shallow: true
  end
end
