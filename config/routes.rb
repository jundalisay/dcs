Rails.application.routes.draw do
    
  root 'users#index'
  # root new_user_session_path
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

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