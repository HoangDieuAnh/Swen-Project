Rails.application.routes.draw do

  #get 'sessions/login,'

  #get 'sessions/home,'

  #get 'sessions/profile,'

  #get 'sessions/setting'
    

    match '/about' , controller: 'pages', action: 'about', via: :get
    match '/contact' , controller: 'pages', action: 'contact', via: :get
    match '/privacy' , controller: 'pages', action: 'privacy', via: :get
    match '/terms' , controller: 'pages', action: 'terms', via: :get

    match '/login_attempt', controller: 'sessions', action: 'login_attempt', via: :post
    match '/new', controller: 'user', action: 'new', via: [:get, :post]
    match '/create', controller: 'user', action: 'create', via: :post
    match '/logout', controller:'sessions', action:'logout', via: [:post, :get]
    match 'event/create', controller: 'event', action: 'create', via: [:post, :get]
    match 'event/index', controller: 'event', action: 'index', via: :get
    #post '/login_attempt'     => 'high_voltage/pages#show', id: 'home'
    get '/home', to: redirect('/')
    
  root :to => 'pages#home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   #root 'welcome#index'

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
