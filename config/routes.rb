Rails.application.routes.draw do
  
  root 'users#index'
  
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions"}
  resources :users 

  resources :educations
  resources :employments

end