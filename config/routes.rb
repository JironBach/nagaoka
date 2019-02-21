Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'

  resources :subject2, only: [:show] do
    resources :lecture_item, only: [:show]
  end
end
