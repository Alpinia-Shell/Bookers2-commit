Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about' ,as: 'about'
  resources :books, only:[:edit, :create, :show, :index]
  devise_for :users
  resources :users, only:[:index,:show]

  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
