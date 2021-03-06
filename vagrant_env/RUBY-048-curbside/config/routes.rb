Rails.application.routes.draw do
  get 'orders/index'

  get 'carts/index'

  get 'users/:user_id/order_carts' => 'order_carts#index'

  get 'users/:user_id/order_carts/:id' => 'order_carts#show'

  post 'users/:user_id/restaurants/:restaurant_id/order_carts' => 'order_carts#create'

  delete 'users/:user_id/order_carts/:id' => 'order_carts#destroy'


  get 'menus/index'

  get 'menus/new'

  post 'menus/create'

  get 'menus/show'

  get 'menus/edit/:id' => 'menus#edit'

  patch 'menus/:id' => 'menus#update'

  delete 'menus/:id' => 'menus#destroy'



  get 'dishes/index'

  get 'dishes/new/:id' => 'dishes#new', as: 'dishes_new'

  post 'dishes/create/:id' => 'dishes#create'

  get 'dishes/show'

  get 'dishes/edit/:id' => 'dishes#edit'

  patch 'dishes/:id' => 'dishes#update'

  delete 'dishes/:id' => 'dishes#destroy'



  get 'dishtypes/index'

  get 'dishtypes/new'

  post 'dishtypes/create'

  get 'dishtypes/show'

  get 'dishtypes/edit/:id' => 'dishtypes#edit', as: 'dishtypes_edit'

  patch 'dishtypes/:id' => 'dishtypes#update', as: 'dishtypes_'

  delete 'dishtypes/:id' => 'dishtypes#destroy'



  get 'categories/index'

  get 'categories/new'

  post 'categories/create'

  get 'categories/show'

  get 'categories/edit/:id' => 'categories#edit', as: 'categories_edit'

  patch 'categories/:id' => 'categories#update'

  delete 'categories/:id' => 'categories#destroy'



  get 'restaurants/index'

  get 'restaurants/new'

  post 'restaurants/create'

  get 'restaurants/:id' => 'restaurants#show'
  
  get 'restaurants/edit/:id' => 'restaurants#edit', as: 'restaurants_edit'

  patch 'restaurants/:id' => 'restaurants#update'

  delete 'restaurants/:id' => 'restaurants#destroy'




  get 'sessions/index'

  get 'sessions/new'

  post 'sessions/create'

  delete 'sessions/destroy'



  get 'users/index'

  get 'users/new'

  get 'users/show'

  get 'users/edit'

  post 'users/create'

  patch 'users/update'

  delete 'users/destroy'




  root 'sessions#new'

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
