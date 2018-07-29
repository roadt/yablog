Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]  
  resources :likes
  resources :comments


  resources :articles do
    collection do
      get :most_liked
    end 
    resources :comments
  end 

  
  resources :posts do 
    resources :comments
  end
 
  get 'home/index'
  get 'home/most_liked'

  
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
