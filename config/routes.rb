Rails.application.routes.draw do
  
  
  root 'home#index'
  
  resources :home do
    collection { post :importpub, :importperform,:importbooth }
  end
  get 'taki' => 'home#taki'
  get 'blank-page' => 'home#blank-page'
  get 'bootstrap-elements' => 'home#bootstrap-elements'
  get 'bootstrap-grid' => 'home#bootstrap-grid'
  get 'charts' => 'home#charts'
  get 'intro' => 'home#intro'
  get 'index-rtl' => 'home#index-rtl'
  get 'performlist' => 'home#performlist'
  get 'index' => 'home#index'
  get 'publist' => 'home#publist'
  get 'publist2' => 'home#publist2'
  get '/pubintro/:pub_id' =>'home#pubintro'
  get 'performintro' => 'home#performintro'
  get '/event' => 'home#event'
  post '/reply_pub' => 'home#reply_pub'
  post '/reply_perform' => 'home#reply_perform'
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
