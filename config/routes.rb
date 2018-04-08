Rails.application.routes.draw do
  
  resources :microposts
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :checklists 
  get 'school_admin/index'
  #get 'checklists/checklists_index'


  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get '/landing', to: 'devise/registrations#landing'
    get '/dashboard' => "devise/registrations#dashboard", as: :user_root  
    match '/new_admin', :controller => 'registrations', :action => 'new_admin', :via => :get    # post "devise/registrations#new_admin"
    match '/new_admin', :controller => 'registrations', :action => 'create_admin', :via => :post    # post "devise/registrations#new_admin"
  end  

  #require 'omniauth-google-oauth2'
  #get 'sessions/create'

  #get 'sessions/destroy'

  #get 'home/show'
  #get 'sessions/user'
  
  resources :users
  resources :layouts
  resources :startup
  #resources :google_user
  resources :schools
  resources :messages do
    resources :comments
  end
  resources :search, only: [:index]


  # This is used for approving and rejecting users
  match 'users/:id/approve'=> 'users#approve_user', as: 'approve_user', :via => :patch
  match 'users/:id/reject'=> 'users#reject_user', as: 'reject_user', :via => :delete
  # match 'users/:id/get_modal' => 'users#get_modal', as: 'get_modal', :via => :get

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'startup#index'
  #messageRoot 'messages#index'
  
  # get 'starutp/aboutus', to: 'startup#aboutus', as: :aboutus
  match '/aboutus', to: 'startup#aboutus', :via => [:get, :post]
  match '/startup',to:'startup#index',:via => [:get, :post]
  match '/contactus',to:'startup#contactus',:via => [:get, :post]
  get '/new_school' => "schools#new"  
  get '/schools/:id', to: 'schools#show'
  get '/edit_school', to: 'schools#edit'
  get '/edit_school', to: :edit, controller: 'schools'
  # get '/dashboard' => "startup#dashboard", as: :user_root  
  get '/landing', to: 'startup#landing'


  get '/checklists_index', to: 'checklists#checklists_index'
  get '/ch_list_school_id', to: 'schools#ch_list_school_id', as: 'ch_list_school_id'
  # get 'landing', to: 'devise/registrations#landing'

  get 'search', to: 'layouts#search'

  # User scope
  # devise_scope :user do
  #     get '/dashboard' => "registrations#show", as: :user_root  
  # end

  # match '/schools/:id' => 'schools#edit', :via=> [:get, :post]
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
    #get 'checklists/checklists_index', to: 'checklists#checklists_index'

    #resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]

  
 


end
