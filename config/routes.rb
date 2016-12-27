Rails.application.routes.draw do

  resources :projects do
    resources :tests
    resources :builds 
  end

  namespace :api do
    resources :projects do
      resources :builds
    end
  end

end
