Writeriki::Application.routes.draw do

  resources :messages


  # get "activities/index"

  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}

  devise_for :users

  resources :activities

  resources :attachments
  
  resources :discusses do
    resources :comments
  end

  resources :events do
    resources :comments
    # 任务的排序
    member do
      get :asc
    end
  end
  
  resources :docs do
    resources :comments
  end

  resources :projects do
    # 定义用户加入或者退出项目
    member do
      get :join,:quit
    end
  end

  # 用户创建的项目列表
  match '/myprojects' => 'myprojects#index', :as => 'myproject'

  # 用户创建的文档列表
  match '/mydocs' => 'mydocs#index', :as => 'mydoc'

  # 列举由用户创建的事件列表
  match '/myevents' => 'myevents#index', :as =>'myevent'

  # 任务与用户的关系列表
  match '/tasks' => 'task#index', :as => 'task'

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
  root :to => 'projects#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
