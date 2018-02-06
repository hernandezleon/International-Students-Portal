Rails.application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  require 'omniauth-google-oauth2'
  get 'sessions/create'

  get 'sessions/destroy'

  get 'sessions/user'

  get 'home/show'

  resources :layouts
  resources :startup
  resources :microposts
  resources :users
  resources :google_user

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'startup#index'
  
  #get 'starutp/help', to: 'startup#help', as: :help
  match '/help', to: 'startup#help', :via => [:get, :post]
  match '/startup',to:'startup#index',:via => [:get, :post]
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  
  
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('startup')
    get 'signout', to: 'sessions#destroy', as: 'signout'
    resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]

    post ':controller(/:action(/:id(.:format)))'
    get ':controller(/:action(/:id(.:format)))'
  
 


end
