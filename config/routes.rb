Rails.application.routes.draw do
  
  namespace :api do
    resources :projects do
      resources :builds
    end
  end

end
