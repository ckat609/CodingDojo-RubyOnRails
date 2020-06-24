Rails.application.routes.draw do
  post 'comments/create/:event_id' => 'comments#create'



  get 'attendings/create/:id' => 'attendings#create'

  get 'attendings/destroy/:id' => 'attendings#destroy'



  get 'events/index'

  get 'events/edit/:id' => 'events#edit', as: 'events_edit'

  patch 'events/update/:id' => 'events#update'

  get 'events/new'

  post 'events/create'

  get 'events/show/:id' => 'events#show', as: 'events_show'

  get 'events/destroy/:id' => 'events#destroy'



  get 'events/destroy'

  get 'sessions/index'

  get 'sessions/new'

  post 'sessions/create'

  delete 'sessions/destroy'



  get 'users/index'

  get 'users/new'

  get 'users/show/:id' => 'users#show', as: 'users_show'

  get 'users/edit/:id' => 'users#edit', as: 'users_edit'

  post 'users/create'

  patch 'users/update/:id' => 'users#update'

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
