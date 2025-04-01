Rails.application.routes.draw do
  root to: 'homes#home'
  get 'home/about' => 'homes#about'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
