Rails.application.routes.draw do
  
  root 'users#new'

  resources :users, only: [:new, :create]
  resources :quizzes, only: [:show] do
    member do
      get :complete
    end
  end
  resources :user_answers, only: [:update]
end
