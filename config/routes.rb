Rails.application.routes.draw do
  get 'groups/manage_group' # technically this is the page to manage the users in the group
  get 'groups/manage_group_users'
  resources :groups
  resources :items
  get 'lists/archive'
  get 'lists/archives' # not the same as 'lists/archive'
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
