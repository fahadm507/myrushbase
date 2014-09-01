Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :users, only: [:index, :show] do
    resources :subjects
    resources :groups do
      resources :groupfollowers, only: [:index, :show, :create, :destroy]
      resources :memberships, only: [:index, :show, :create, :destroy]
      resources :groupposts
    end
    resources :questions do
      resources :answers
    end

    resources :points, only: [:create, :destroy]
    member do
      get :following, :followers
    end
  end


  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  # root to: 'users#show'

  resources :relationships, only: [:create, :destroy]
  resources :posts, only: [:create, :new, :destroy] do
    resources :comments, only:[:create, :new, :destroy]
    resources :likes, only: [:new, :create, :destroy]
  end
  # You can have the root of your site routed with "root"
  root 'home#index'

  get "/<%= user.user_name %>"=> 'users#show'
  get '/search' => 'users#search'
  get '/groups' => 'groups#index'
  get  '/groups/:id' => 'groups#show'
  get '/groupposts/:id' => 'groupposts#groupposts'
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
