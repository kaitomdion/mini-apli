Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'comments#index'
  get 'comments' => 'comments#index'
  get 'comments/new' => 'comments#new'
  post 'comments' => 'comments#create'
  delete  'comments/:id'  => 'comments#destroy'
  patch   'comments/:id'  => 'comments#update'
  get   'comments/:id/edit'  => 'comments#edit'
end
