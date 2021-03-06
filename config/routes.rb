Collectionandintegration::Application.routes.draw do
  
  get "static_pages/about"
  get "static_pages/contactus"
  get "static_pages/api"
#  resources :logins
  resources :ssdmappings

  resources :socialmediasites

  resources :businesses
  #resources :dashboard, controller: "dashboard"
  #resources :sessions
  #get "users/index", to: 'logins#index'
 # get "logins/new"
 # get "logins/show"
 # get "logins/edit"
 # get "logins/update"
 # get "logins/destroy"

  get "socialmediasite/new"
  get "socialmediasite/create"
  get "ssdmapping/new"
  get "ssdmapping/create"
  get "ssdmetadata/new"
  get "ssdmetadata/create"
  get "business/new"
  get "business/create"
 # get "session/new"
  get "business_controller/new"
  get "business_controller/create"
 # get "session_controller/create"
 # get "session_controller/destroy"

#  devise_for :logins,:path => '',  :path_names => { :sign_in => "signin", :sign_out => 'logout'}
#   devise_for :logins, :controllers => {:registrations => "registrations"}
  # devise_for :logins
   devise_for :logins, :skip => [ :registrations]
   devise_scope :login do
     get '/signin' => 'devise/sessions#new'
     get '/logout' => 'devise/sessions#destroy'
     get 'edit-registration' => 'devise/registrations#edit', :as => :edit_login_registration
     post 'create-registration' => 'devise/registrations#create', :as => :login_registration
   end
   resources :logins,  :controller => "logins"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

    root :to => 'home#index'

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
end
