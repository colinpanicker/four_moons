FourMoons::Application.routes.draw do



  get "chat/home"

 resources :users do
collection do
 put 'addstream'
 get 'option'
 put 'addimage'
 delete 'del_notifications'
 delete 'delete_profile'
end
member do
get :following, :followers ,:stream_following
end
end

resources :streams do
  member do
   get :stream_followers
end
end




resources :files do
  collection do
    post 'addfile'
    get 'list'
    get 'download'
    delete 'delete_file'
  end
end


resources :groups do
  collection do
    put 'sendrequest'
    put 'accept'
    put 'reject'
    delete 'deletestatus'
    get 'viewstatus'
    put 'addpost'
    delete 'delete_group'
    delete 'leave'
  end
end


resources :posts do
  collection do
    post 'createpost'
    post 'addcomment'
    delete 'deletecomment'
    delete 'deletepost'
  end
end

resources :questions do
  collection do
    post 'createreply'
    delete 'deletereply'
  end
end

  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :stream_users, only: [:create, :destroy]


  match 'add_notifications', to: 'users#notification'
  match 'newgroup', to: 'groups#new' 
  match 'allgroups', to: 'groups#index'
  
  root :to => 'static_pages#home'
   
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/search' , to: 'users#formdata'
  match '/signout', to: 'sessions#destroy', via: :delete
  match "/chat/send", :controller => "chat", :action => "send_message" 
  get 'tags/:tag', to: 'questions#index', as: :tag  


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
   

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
