Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get     '/lists',     to: 'lists#index'
  get     '/lists/:id', to: 'lists#show'
  post    '/lists',     to: 'lists#create'
  put     '/lists/:id', to: 'lists#update'
  delete  '/lists/:id', to: 'lists#destroy'

  get     '/tasks',     to: 'tasks#index'
  get     '/tasks/:id', to: 'tasks#show'
  post    '/tasks',     to: 'tasks#create'
  put     '/tasks/:id', to: 'tasks#update'
  delete  '/tasks/:id', to: 'tasks#destroy'
end
