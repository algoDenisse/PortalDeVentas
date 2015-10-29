Rails.application.routes.draw do
  
  resources :userfbs do
    member  do
      get 'defineAdminRole'
    end
  end
  resources :articles do
    resources :reviews, only:[:create, :destroy, :update] do
      member  do
        get 'banReview'
      end
    end 
    resources :notifications
    member  do
      get 'approveArticle'
    end
    member  do
      get 'rejectArticle'
    end 
    member do
        get :like
    end
  end
  
  get 'indexRegularUsers' => 'articles#indexRegularUsers'
  resources :user_types
  resources :categories
  resources :users do
    member  do
      get 'defineAdminRole'
    end
  end
  resources :sessions_l, only: [:new, :create, :destroy]

  get 'myArticles', to: 'articles#myArticles', as: 'myArticles'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions_l#new', as: 'login'
  get 'logout', to: 'sessions_l#destroy', as: 'logout'
  get 'sessions/create'
  get 'sessions/destroy'
  match 'auth/:provider/callback', :via => [:get],to: 'sessions#create'
  match 'auth/failure', :via => [:get],to: redirect('/')
  match 'signout',:via => [:get], to: 'sessions#destroy', as: 'signout'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'sessions_l#new'

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
