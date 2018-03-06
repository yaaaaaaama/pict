Rails.application.routes.draw do
   
  get 'goods/create'

  get 'goods/delete'

  get 'create/delete'

  root "plans#index"
  get 'plans/index'
  get 'plans/show'
  get 'plans/show/:id', to: 'plans#show'  
  get 'plans/new'    
  get 'plans/create'
  post 'plans/create/', to: 'plans#create'

  get 'comments/new/:id', to: 'comments#new'
  get 'comments/new/:create', to: 'comments#create'  
  get 'comments/create'
  get 'comments/create/:plan_id', to: 'plans#show'  
  post 'comments/create/', to: 'comments#create'

  resources :plans do
    resources :goods, only: [:create, :destroy]
  end

  devise_for :users, controllers: {
    :omniauth_callbacks => "users/omniauth_callbacks"
  }
  get "users/show", as: 'user_root'
  get 'users/enter'
  get 'users/show'
  get 'users/edits'  
  post 'users/show/', to: 'users#update'
  post 'users/show/', to: 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end
