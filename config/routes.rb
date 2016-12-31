Rails.application.routes.draw do
    
  root 'users#index'
  
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions"}
  resources :users 

  resources :educations do
    member do
      resources :users_eds
    end
  end

  resources :employments do
    member do
      resources :users_emps
    end
  end

end