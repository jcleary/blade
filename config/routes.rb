Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'pages#index' 

  resources :projects do
    resources :tests
    resources :builds do
      resources :test_runs
    end
  end

  namespace :api do
    resources :projects do
      resources :builds
    end
  end

end
