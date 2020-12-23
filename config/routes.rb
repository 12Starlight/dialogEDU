Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do 
    resources :users, only: [:create, :show] 

    resource :session, only: [:create, :destroy]
    
    resources :articles do 
      member do
        get :search, to: "articles#search", as: "search"
      end
    end

    resources :comments do 
      member do
        get :filter, to: "comments#filter", as: "filter"
      end
    end
  end

  root "static_pages#root"
end
