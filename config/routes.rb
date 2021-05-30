Rails.application.routes.draw do
  namespace :admin do
    root to: 'dashboards#index', as: :root
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'

    resources :users, only: %i[index show edit update destroy]
    resources :boards, only: %i[index show edit update destroy]
  end

  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :password_resets, only: %i[new create edit update]
  resource :profile, only: %i[show edit update]
  resources :boards do
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
