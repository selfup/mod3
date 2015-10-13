Rails.application.routes.draw do
  root 'stores#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :stores, path: ":store", as: :store do
    resources :items
  end
end

# namespace :stores, path: ":store", as: :store do
#   resources :items, path: ":item"
# end
