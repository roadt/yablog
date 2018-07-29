Rails.application.routes.draw do

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
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
