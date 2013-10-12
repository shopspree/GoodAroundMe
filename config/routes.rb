Goodaroundme::Application.routes.draw do

  resources :tesets


  # devise
  devise_for :users, constraints: { format: :html }
  devise_for :users, controllers: { sessions: "api/v1/sessions", registrations: "api/v1/registrations" }, constraints: { format: :json}

  # (web front)
  resources :organizations

  # /api/*
  namespace :api do

    # /api/v1/*
    namespace :v1 do

      # /activities
      resources :activities, only: [:index, :show]

      # /organization_categories/
      resources :organization_categories, only: [:index] do
        resources :organizations, only: [:create]
      end

      # /organizations
      resources :organizations, only: [:index, :show, :update, :destroy] do
        post 'follow'
        delete 'unfollow'
        get 'followers'

        # /organizations/:organization_id/posts
        resources :posts, only: [:index]

        # /organizations/:organization_id/activities
        resources :activities, only: [:index]
      end

      # /users/:email
      put 'users/:email/update_password', to: 'users#update_password', constraints: { email: /[^\/]+/ }
      get 'users/:email', to: 'users#show', constraints: { email: /.*(?=\.json)/ }
      put 'users/:email', to: 'users#update', constraints: { email: /.*(?=\.json)/ }

      # /posts
      resources :posts, only: [:show, :create, :update, :destroy] do

        # /posts/popular
        get 'popular', on: :collection

        # /post/:post_id/activities
        resources :activities, only: [:index]

        # /posts/posts_by_user_id/1
        #get 'posts_by_user_id/:id', on: :collection

        # /posts/:post_id/comments
        resources :comments, only: [:index, :show, :create, :update, :destroy]

        # /posts/:post_id/likes
        resources :likes, only: [:index, :create, :update, :destroy]

        # /posts/:post_id/mentions
        resources :mentions, only: [:index, :create, :destroy]

        # /posts/:post_id/inappropriate_reports
        resources :inappropriate, controller: :inappropriate_reports, only: [:create]
      end

      # /comments
      resources :comments, only: [] do

        # /comments/:comment_id/likes
        resources :likes, only: [:index, :create, :update, :destroy]

        # /comments/:post_id/reports
        resources :inappropriate, controller: :inappropriate_reports, only: [:create]

      end

      # /problems
      resource :problems, only: [:create]

      # /facebook
      get 'facebook/callback'

    end
  end

  #root to: "activities#index"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'


  #devise_scope :users do
  #  namespace :api do
  #    namespace :v1 do
  #      resources :sessions, :only => [:create, :destroy]
  #      resources :registrations, :only => [:create]
  #    end
  #  end
  #end
end
