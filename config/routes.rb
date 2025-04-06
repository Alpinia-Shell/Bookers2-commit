Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about' ,as: 'about'
  resources :books, only:[:new, :edit, :create, :show, :index,:update, :destroy]
  devise_for :users
  resources :users, only:[:index,:show, :update]

  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
