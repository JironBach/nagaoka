Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'
  post 'regist', to: 'index#regist'
  post 'login', to: 'index#login'
  get 'logout', to: 'index#sign_out!'
  post 'index/:subject1_id/subject2/:subject2_id/lecture_item/:id', to: 'lecture_item#update'

  resources :index do
    resources :subject2 do
      resources :lecture_item
    end
  end
end
