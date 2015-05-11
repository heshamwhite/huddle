Rails.application.routes.draw do

  resources :groupreplies
  get 'groups/searchnearest'
  get 'groups/searchstr'

  get 'users/ :id/ :mystring', to: 'users#confirm'
# get 'auth/:provider/callback', to: 'sessions#create'
#   get 'auth/failure', to: redirect('/')
#   get 'signout', to: 'sessions#destroy', as: 'signout'
  
  get 'sessions/new'
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  get "usermessages" => "usermessages#create"
  get "usermessages/getmymessages" => "usermessages#getmymessages"
  get "usermessages/show/:id" => "usermessages#show"
  post "usermessages/create" => "usermessages#create", :as => "usermessages/create"
  patch "groups/uploadgroupimages/:id" => "groups#uploadgroupimages", :as => "groups/uploadgroupimages"
  get "groups/newgroupimages/:id" => "groups#newgroupimages"
  get "notifications/getusernotification" => "notifications#getusernotification"
  get "users/profilepage" => "users#profilepage"
  get "users/editprofile" => "users#editprofile"
  patch "users/updateprofile" => "users#updateprofile"
  root :to => "welcome#index"
  resources :notifications
  resources :groupmessages
  resources :eventcomments
  resources :groupimages
  resources :events do
    member do

      get :membership, :as => 'membership'
      get :memberjoin, :as => 'memberjoin'

    end
  end
  #resources :groups
  resources :groups do
    member do
      get :images, :as => 'images'
      get :membership, :as => 'membership'
      get :memberjoin, :as => 'memberjoin'
      get :searchneasrest, :as => 'searchneasrest'
      get :members, :as => 'members'
    end
  end
  resources :users
  resources :sessions
  #root 'welcome#index'
  get 'welcome/index'

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
