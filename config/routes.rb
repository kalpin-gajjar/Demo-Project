Rails.application.routes.draw do
  devise_for :users, controllers: { 
      sessions: 'users/sessions' 
  }
  
  root "users#index"
  resources :users
  post "user/delete_pic", to: "users#delete_image"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
