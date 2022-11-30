Rails.application.routes.draw do
  resources :items
  get 'lists/archive'
  resources :lists
  resources :students
  
  devise_scope :user do
    # Redirects signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users
  
  get 'pages/home'
  get 'user_management/index'
  get 'user_management/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
